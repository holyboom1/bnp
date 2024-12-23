import 'package:hive_ce/hive.dart';

import '../../../models/app_settings_model.dart';
import '../../../models/settings_model.dart';

abstract interface class HiveProvider {
  late Box<SettingsModel> settingsBox;
  late Box<AppSettingsModel> appSettingsBox;

  Future<void> init();

  void clear();
}
