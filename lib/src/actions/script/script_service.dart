import 'dart:io';

import 'package:dcli/dcli.dart' as dcli;
import 'package:interact_cli/interact_cli.dart';

class ScriptService {
  Future<void> prebuildAction() async {
    final int input = Select(
      prompt: 'Choose option:',
      options: [
        'Pub Get (Full Project)',
        'Pub Get (Single Module)',
        'Pub Get and Generate (Full Project)',
        'Pub Get and Generate (Single Module)',
        'Build Runner for module',
        'Flutter Clean (Full Project)',
        'Flutter Clean (Single Module)',
        'Back to Main Menu',
      ],
    ).interact();

    switch (input) {
      case 0:
        await _flutterPubGetFullProject();
        break;
      case 1:
        await _flutterPubGetSingleModule();
        break;
      case 2:
        await runCommand('flutter pub run build_runner build --delete-conflicting-outputs');
        break;
      case 3:
        await runCommand('flutter pub run build_runner build --delete-conflicting-outputs');
        break;
      case 4:
        await runCommand('flutter pub run build_runner build --delete-conflicting-outputs');
        break;
      case 5:
        await runCommand('flutter clean');
        break;
      case 6:
        await runCommand('flutter clean --module');
        break;
      default:
        break;
    }
  }

  Future<void> _flutterPubGetFullProject() async {
    if (Platform.isMacOS || Platform.isLinux) {
      await runCommand(
          'find . -name "pubspec.yaml" -not -path "./.flutter.git/*" -execdir flutter pub get \;');
    } else if (Platform.isWindows) {
      await runCommand(
          'Get-ChildItem -Recurse -Filter "pubspec.yaml" | Where-Object { \$_.FullName -notlike "*\.flutter.git\*" } | ForEach-Object { Set-Location -Path \$_.DirectoryName; flutter pub get }');
    }
  }

  List<String> findModules() {
    final List<String> modulesPath = [];
    final Directory current = Directory.current;

    /// Make recursive search for modules
    final List<FileSystemEntity> modules = current.listSync(recursive: true);
    for (final FileSystemEntity module in modules) {
      if (module.path.contains('pubspec.yaml')) {
        modulesPath.add(module.parent.path);
      }
    }
    return modulesPath;
  }

  Future<void> _flutterPubGetSingleModule() async {
    final List<String> modules = findModules();
    final int moduleIndex = Select(
      prompt: 'Select Module:',
      options: modules,
    ).interact();
    final int module = Select(prompt: 'Select Module:', options: modules).interact();
    final String moduleToCommand = modules[moduleIndex];
    print('#modules# : ${modules}');
    await runCommand('cd $module && flutter pub get');
  }

  static Future<void> runCommand(String command) async {
    final SpinnerState runnerIndicator = Spinner(
      icon: '🚀',
      leftPrompt: (done) => '',
      rightPrompt: (state) => switch (state) {
        SpinnerStateType.inProgress => 'Processing...',
        SpinnerStateType.done => 'Done!',
        SpinnerStateType.failed => 'Failed!',
      },
    ).interact();

    if (Platform.isMacOS || Platform.isLinux) {
      await _runBashCommand(command, runnerIndicator);
    } else if (Platform.isWindows) {
      await _runCommand(command, runnerIndicator);
    }
  }

  static Future<void> _runCommand(String command, SpinnerState runnerIndicator) async {
    final ProcessResult result = await Process.run('pwsh', ['-c', command]);
    if (result.exitCode != 0) {
      runnerIndicator.failed();
      stdout.writeln(dcli.red('Error: ${result.stderr}'));
      exit(result.exitCode);
    }
    runnerIndicator.done();
    stdout.writeln(result.stdout);
  }

  static Future<void> _runBashCommand(String command, SpinnerState runnerIndicator) async {
    final ProcessResult result = await Process.run('bash', ['-c', command]);
    if (result.exitCode != 0) {
      runnerIndicator.failed();
      stdout.writeln(dcli.red('Error: ${result.stderr}'));
      exit(result.exitCode);
    }
    runnerIndicator.done();
    stdout.writeln(result.stdout);
  }
}
