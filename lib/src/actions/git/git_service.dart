import 'dart:io';

import 'package:dcli/dcli.dart' as dcli;

import '../../data/config/network/dio_config.dart';
import '../../data/providers/api/gitlab/gitlab_api_provider.dart';
import '../../data/providers/safe_request.dart';
import '../../di/app_di.dart';
import '../../models/app_settings_model.dart';
import '../../models/merge_request_model.dart';
import '../../models/settings_model.dart';
import '../changelog/changelog_service.dart';
import '../settings/settings_service.dart';

enum GitType {
  gitlab,
  github;

  static GitType getGitType(String gitUrl) {
    if (gitUrl.contains('gitlab')) {
      return GitType.gitlab;
    } else if (gitUrl.contains('github')) {
      return GitType.github;
    } else {
      throw Exception('Unsupported git type');
    }
  }
}

class GitService {
  GitService() {
    appLocator.registerSingleton<GitService>(this);
  }

  Future<List<MergeRequestModel>> fetchMergeRequest({
    required DateTime lastBuildDate,
  }) async {
    final AppSettingsModel? appSettings = appLocator<ChangeLogService>().currentAppSettings;
    final SettingsModel globalSettings = appLocator<SettingsService>().settings;
    if (appSettings == null) {
      stdout.writeln(dcli.green('No app settings found.'));
      exit(1);
    }
    final String? gitUrl = appSettings.gitLink;
    final String? privateToken = appSettings.projectToken ?? globalSettings.privateToken;
    if (gitUrl == null || privateToken == null) {
      stdout.writeln(dcli.green('GitLab URL or private token not found.'));
      exit(1);
    }
    final gitType = GitType.getGitType(gitUrl);
    try{
      switch (gitType) {
        case GitType.gitlab:
          return fetchGitLabMergeRequest(
              appSettings: appSettings, lastBuildDate: lastBuildDate, privateToken: privateToken);
        case GitType.github:
          return fetchGitHubMergeRequest();
      }
    }
    catch(e, s ){
      stdout.writeln(dcli.red('Error: $e'));
      stdout.writeln(dcli.red('Stack: $s'));

      exit(1);
    }

  }

  Future<List<MergeRequestModel>> fetchGitLabMergeRequest({
    required DateTime lastBuildDate,
    required AppSettingsModel appSettings,
    required String privateToken,
  }) async {
    final GitLabApiProvider gitLabApiProvider = GitLabApiProvider(
      appLocator<DioConfig>().dio,
      baseUrl: appSettings.gitLink!,
    );
    appLocator<DioConfig>().dio.options.headers['PRIVATE-TOKEN'] = privateToken;
    final String? projectId = appSettings.projectId;
    final String since = lastBuildDate.toIso8601String().split('T').first;

    final List<MergeRequestModel> mergeRequests = [];
    int page = 1;

    while (true) {
      final List<MergeRequestModel> data =
          await safeRequest(() => gitLabApiProvider.fetchLastMergedRequests(
                projectId: projectId!,
                state: MergeRequestState.merged.toStringType(),
                page: page,
              ));

      for (final MergeRequestModel mr in data) {
        if (mr.merged_at == null) {
          continue;
        }
        if (mr.merged_at!.compareTo(lastBuildDate) > 0) {
          mergeRequests.add(mr);
        } else {
          return mergeRequests;
        }
      }
      page++;
    }
  }

  fetchGitHubMergeRequest() async {
    throw Exception('Not implemented');
  }

  Future<void> commitAndPushChanges(
      {required String changelogFile, required String branch, String? newVersion}) async {
    await Process.run('git', ['checkout', '-B', branch]);
    await Process.run('git', ['add', changelogFile]);
    await Process.run(
        'git', ['commit', '-m', 'Update CHANGELOG ${newVersion != null ? 'to $newVersion' : ''}']);
    await Process.run('git', ['push', '-u', 'origin', branch]);
  }
}
