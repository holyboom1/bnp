import 'dart:developer';
import 'dart:io';

import 'package:hive_ce/hive.dart';

import '../../../models/app_settings_model.dart';
import '../../../models/settings_model.dart';
import 'hive_provider.dart';

class HiveProviderImpl implements HiveProvider {
  @override
  late Box<AppSettingsModel> appSettingsBox;

  @override
  late Box<SettingsModel> settingsBox;

  static const String _keySettings = 'settings';
  static const String _keyAppSettings = 'app_settings';

  @override
  Future<void> init() async {
    try {
      final String executablePath = Platform.script.toFilePath();

      final String directoryPath = Directory(executablePath).parent.parent.parent.path;
      final String hivePath = '$directoryPath/bnp_hive';
      Directory(hivePath).createSync();
      Hive.init(hivePath);
      Hive.registerAdapter(SettingsModelAdapter());
      Hive.registerAdapter(AppSettingsModelAdapter());

      appSettingsBox = await Hive.openBox<AppSettingsModel>(
        _keyAppSettings,
      );
      settingsBox = await Hive.openBox<SettingsModel>(
        _keySettings,
      );
    } catch (e, stacktrace) {
      log('#HIVE error# : $e');
      log(stacktrace.toString());
    }
  }

  @override
  void clear() {
    appSettingsBox.clear();
    settingsBox.clear();
  }
}
