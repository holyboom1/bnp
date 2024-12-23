import 'dart:io';

import 'package:dcli/dcli.dart' as dcli;

import '../services/script_service.dart';

Future<void> helpAction() async {
  // Check if the Dart version is in the correct range
  if (!await ScriptService.isDartVersionInRange('2.19.5', '4.0.0')) {
    stdout.writeln(dcli.red('Dart version not in range 2.19.5 - 4.0.0'));
    return;
  }

  stdout.writeln(dcli.green('➡️ BNP Help ⬅️'));
  stdout.writeln(dcli.green('🔘 settings: Show the settings'));
  stdout.writeln(dcli.green('🔘 add: Add a new app setting'));
  stdout.writeln(dcli.green('🔘 update: Change app setting'));
  stdout.writeln(dcli.green('🔘 remove: Remove an app setting'));
  stdout.writeln(dcli.green('🔘 build: Build the app'));
  stdout.writeln(dcli.green('🔘 update: Update the changelog'));
  stdout.writeln(dcli.green('🔚 help: Show this help message'));
}
