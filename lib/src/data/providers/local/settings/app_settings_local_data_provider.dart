import 'package:hive_ce/hive.dart';

import '../../../../models/app_settings_model.dart';

class AppSettingsHiveProvider {
  final Box<AppSettingsModel> _appSettingsBox;

  AppSettingsHiveProvider(this._appSettingsBox);

  List<AppSettingsModel> getAppSettingsList() {
    return _appSettingsBox.values.toList();
  }

  Future<void> saveSettings(AppSettingsModel settings) async {
    await _appSettingsBox.put(settings.appIdInternal, settings);
  }

  Future<void> deleteSettings(String projectId) async {
    await _appSettingsBox.delete(projectId);
  }

  void clear() {
    _appSettingsBox.clear();
  }
}
