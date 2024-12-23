import 'dart:developer';
import 'dart:io';

import 'package:dcli/dcli.dart' as dcli;
import 'package:interact_cli/interact_cli.dart';

import '../../di/app_di.dart';
import '../../models/app_settings_model.dart';
import '../../models/merge_request_model.dart';
import '../git/git_service.dart';
import '../settings/settings_service.dart';

class ChangeLogService {
  ChangeLogService() {
    appLocator.registerSingleton<ChangeLogService>(this);
  }

  AppSettingsModel? currentAppSettings;

  Future<({String changes, String newVersion})?>? updateChangelog(
      {bool? isNeedCommit = true}) async {
    currentAppSettings = appLocator<SettingsService>().getCurrentApp();
    if (currentAppSettings == null) {
      stdout.writeln(dcli.green('No app settings found.'));
      return null;
    }
    final DateTime? lastBuildDate = _getLastChangeLogDate();
    if (lastBuildDate == null) {
      stdout.writeln(dcli.green('No last build date found.'));
      return null;
    }

    final List<MergeRequestModel> lastMrs =
        await appLocator<GitService>().fetchMergeRequest(lastBuildDate: lastBuildDate);

    final ({String changes, String newVersion})? updatesInChangelog = _updateChangelogData(
      '${currentAppSettings!.appLocalPath}/${currentAppSettings!.changelogFile}',
      lastMrs,
    );
    stdout.writeln(dcli.green('Changelog updated.'));
    if (updatesInChangelog != null) {
      await commitChangesInChangeLog(updatesInChangelog.newVersion);
    }
    return updatesInChangelog;
  }

  Future<void> commitChangesInChangeLog(String newVersion) async {
    final bool shouldCommit = Confirm(
      prompt: 'Do you want to commit the changes?',
      defaultValue: true,
    ).interact();

    if (shouldCommit) {
      await appLocator<GitService>().commitAndPushChanges(
        changelogFile: currentAppSettings!.changelogFile,
        branch: currentAppSettings!.targetBranch,
        newVersion: newVersion,
      );
    }
  }

  DateTime? _getLastChangeLogDate() {
    final String changeLogPath =
        '${currentAppSettings!.appLocalPath}/${currentAppSettings!.changelogFile}';
    final File file = File(changeLogPath);
    if (!file.existsSync()) {
      return null;
    }
    final List<String> lines = file.readAsLinesSync();
    for (final String line in lines) {
      final RegExpMatch? matchDDMMYY = RegExp(r'\[.*\] - (\d{2}-\d{2}-\d{4})').firstMatch(line);
      final RegExpMatch? matchYYMMDD = RegExp(r'\[.*\] - (\d{4}-\d{2}-\d{2})').firstMatch(line);
      if (matchDDMMYY != null) {
        final List<String> parts = matchDDMMYY.group(1)!.split('-');
        final DateTime dateTime =
            DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
        return dateTime;
      } else if (matchYYMMDD != null) {
        final List<String> parts = matchYYMMDD.group(1)!.split('-');
        final DateTime dateTime =
            DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
        return dateTime;
      }
    }
    return null;
  }

  ({String newVersion, String changes})? _updateChangelogData(
      String filePath, List<MergeRequestModel> mergeRequests) {
    final File changeLogFile = File(filePath);
    if (!changeLogFile.existsSync()) {
      log('File $filePath not found.');
      return null;
    }

    /// TODO improve this
    final File pubSpecFile = File(filePath.replaceAll('CHANGELOG.md', 'pubspec.yaml'));
    final String pubSpecContent = pubSpecFile.readAsStringSync();
    final RegExpMatch? match = RegExp(r'version: (\d+\.\d+\.\d+)').firstMatch(pubSpecContent);

    if (match == null) {
      log('Version not found in pubspec.yaml');
      return null;
    }

    final String? currentVersion = match.group(1);

    if (currentVersion == null) {
      log('Version not found in pubspec.yaml');
      return null;
    }
    final String newVersion;
    if (!currentVersion.contains('+')) {
      final List<String> parts = currentVersion.split('.');
      final int major = int.parse(parts[0]);
      final int minor = int.parse(parts[1]);
      final int patch = int.parse(parts[2]);
      newVersion = '$major.$minor.$patch';
    } else {
      final List<String> parts = currentVersion.split('+');
      final String baseVersion = parts.first;
      final String buildNumberStr = parts.last;

      int? buildNumber;
      try {
        buildNumber = int.parse(buildNumberStr);
      } catch (e) {
        log('Invalid build number in version: $buildNumberStr');
        return null;
      }

      newVersion = '$baseVersion+${buildNumber + 1}';
    }

    final String content = changeLogFile.readAsStringSync();

    String newEntries = '';
    for (final MergeRequestModel mr in mergeRequests) {
      newEntries += '- ${mr.title}\n';
    }

    final String newBlock =
        '## [$newVersion] - ${DateTime.now().toIso8601String().split('T').first}\n$newEntries\n';

    final String updatedContent = content.replaceFirst(
      '## [Unreleased]',
      '## [Unreleased]\n\n$newBlock',
    );
    changeLogFile.writeAsStringSync(updatedContent);

    return (newVersion: newVersion, changes: newEntries);
  }
}
