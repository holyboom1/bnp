import 'dart:io';

import 'package:build_and_push/src/actions/build/build_service.dart';
import 'package:build_and_push/src/actions/changelog/changelog_service.dart';
import 'package:build_and_push/src/actions/git/git_service.dart';
import 'package:build_and_push/src/actions/help_action.dart';
import 'package:build_and_push/src/actions/settings/settings_service.dart';
import 'package:build_and_push/src/di/app_di.dart';
import 'package:build_and_push/src/services/script_service.dart';
import 'package:dcli/dcli.dart' as dcli;
import 'package:interact_cli/interact_cli.dart';

// Main method
void main() async {
  if (!await ScriptService.isDartVersionInRange('3.0.0', '4.0.0')) {
    stdout.writeln(dcli.red('Dart version not in range 3.0.0 - 4.0.0'));
    return;
  }
  await setupDi();
  final SettingsService settingsService = SettingsService();
  final ChangeLogService changeLogService = ChangeLogService();
  final BuildService buildService = BuildService();
  final GitService gitService = GitService();

  Future<void> run() async {
    final int input = Select(
      prompt: 'Build and PUSH:CLI for build and push Flutter apps and update ChangeLogs',
      options: [
        'Build App and Push',
        'Update Changelog',
        'Configure New App Settings',
        'Settings',
        'Help',
        'Exit',
      ],
    ).interact();
    switch (input) {
      case 0:
        await buildService.buildApp();
        break;
      case 1:
        await changeLogService.updateChangelog();
        break;
      case 2:
        await settingsService.addNewAppSetting();
        break;
      case 3:
        await settingsService.showSettings();
        break;
      case 4:
        await helpAction();
        break;
      default:
        exit(0);
    }
    await run();
  }

  await run();
}
