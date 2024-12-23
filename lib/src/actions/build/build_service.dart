import 'dart:io';

import 'package:dcli/dcli.dart' as dcli;
import 'package:interact_cli/interact_cli.dart';

import '../../di/app_di.dart';
import '../../models/app_settings_model.dart';
import '../changelog/changelog_service.dart';
import '../settings/settings_service.dart';

enum PlatformType {
  iOS(name: 'iOS'),
  Android(name: 'Android'),
  Web(name: 'Web'),
  Windows(name: 'Windows'),
  MacOS(name: 'MacOS'),
  Linux(name: 'Linux'),
  backend(name: 'backend'),
  customScript(name: 'customScript');

  final String name;

  const PlatformType({required this.name});
}

class BuildService {
  BuildService() {
    appLocator.registerSingleton<BuildService>(this);
  }

  AppSettingsModel? currentAppSettings;

  Future<void> buildApp() async {
    currentAppSettings = appLocator<SettingsService>().getCurrentApp();
    if (currentAppSettings == null) {
      stdout.writeln(dcli.green('No app settings found.'));
      return;
    }
    final PlatformType platformType = _selectBuildPlatform();
    final String? flavorType = _selectFlavor();

    switch (platformType) {
      case PlatformType.iOS:
        await _buildIOS(flavorType);
        break;
      case PlatformType.Android:
        await _buildAndroid(flavorType);
        break;
      case PlatformType.Web:
        _buildWeb(flavorType);
        break;
      case PlatformType.Windows:
        _buildWindows(flavorType);
        break;
      case PlatformType.MacOS:
        _buildMacOS(flavorType);
        break;
      case PlatformType.Linux:
        _buildLinux(flavorType);
        break;
      case PlatformType.backend:
        _buildBackend(flavorType);
        break;
      case PlatformType.customScript:
        _buildCustomScript(flavorType);
        break;
    }
  }

  PlatformType _selectBuildPlatform() {
    final int input = Select(
      prompt: 'Select Platform:',
      options: PlatformType.values.map((e) => e.name).toList(),
    ).interact();
    return PlatformType.values[input];
  }

  String? _selectFlavor() {
    final int input = Select(
      prompt: 'Select Flavor:',
      options: currentAppSettings!.flavors.map((e) => e).toList(),
    ).interact();
    return currentAppSettings!.flavors[input];
  }

  Future<void> _runCommand(String command) async {
    final ProcessResult result = await Process.run('bash', ['-c', command]);
    if (result.exitCode != 0) {
      stdout.writeln(dcli.red('Error: ${result.stderr}'));
      exit(result.exitCode);
    }
    stdout.writeln(result.stdout);
  }

  Future<void> _buildAndroid(String? flavorType) async {
    stdout.writeln(dcli.green('Building Android APK'));
    final String command =
        'flutter build apk ${flavorType == null ? '' : '--flavor=$flavorType'} ${currentAppSettings!.customBuildArgs}';
    stdout.writeln(dcli.green('Command to build: $command'));
    await _runCommand(command);
    stdout.writeln(dcli.green('Build APK DONE'));
  }

  Future<void> _buildIOS(String? flavorType) async {
    final ({String changes, String newVersion})? updatesInChangelog =
        await appLocator<ChangeLogService>().updateChangelog(isNeedCommit: false);
    final String releaseInfo =
        '${updatesInChangelog != null ? updatesInChangelog.newVersion + ':' : ''} ${updatesInChangelog?.changes ?? ''}';
    final String command =
        'flutter build ipa ${flavorType == null ? '' : '--flavor=$flavorType ${currentAppSettings!.customBuildArgs}'} ';

    stdout.writeln(dcli.green('Building iOS for flavor $flavorType, Release Info: $releaseInfo'));
    stdout.writeln(dcli.green('Command to build: $command'));

    await _runCommand(command);
    stdout.writeln(dcli.green('Build IPA DONE'));

    final File exportOptionsPlist = File('ios/exportOptions.plist');
    if (!exportOptionsPlist.existsSync()) {
      final String releaseInfoXmlEscaped = releaseInfo
          .replaceAll('&', '&amp;')
          .replaceAll('<', '&lt;')
          .replaceAll('>', '&gt;')
          .replaceAll('"', '&quot;')
          .replaceAll("'", '&apos;');
      exportOptionsPlist.writeAsStringSync('''
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>method</key>
    <string>app-store-connect</string>
    <key>destination</key>
    <string>upload</string>
    <key>releaseInfo</key>
    <string>$releaseInfoXmlEscaped</string> 
</dict>
</plist>
''');
    }

    const xcodeCommand =
        'xcodebuild -exportArchive -archivePath build/ios/archive/Runner.xcarchive '
        '-exportOptionsPlist ios/exportOptions.plist '
        '-exportPath build/ios/archive/';

    stdout.writeln(dcli.green('Exporting archive with release info: $releaseInfo'));
    stdout.writeln(dcli.green('Command to export: $xcodeCommand'));
    await _runCommand(xcodeCommand);
    stdout.writeln(dcli.green('Exporting archive DONE'));
  }

  void _buildWeb(String? flavorType) {
    print('Building Web for flavor $flavorType');
  }

  void _buildWindows(String? flavorType) {
    print('Building Windows for flavor $flavorType');
  }

  void _buildMacOS(String? flavorType) {
    print('Building MacOS for flavor $flavorType');
  }

  void _buildLinux(String? flavorType) {
    print('Building Linux for flavor $flavorType');
  }

  void _buildBackend(String? flavorType) {
    print('Building Backend for flavor $flavorType');
  }

  void _buildCustomScript(String? flavorType) {
    print('Building Custom Script for flavor $flavorType');
  }
}
