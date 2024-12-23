import 'package:hive_ce/hive.dart';

import '../../../../models/settings_model.dart';

class SettingsHiveProvider {
  final Box<SettingsModel> _settingsBox;
  final String _key = 'settings';

  SettingsHiveProvider(this._settingsBox);

  SettingsModel getSettings() {
    return _settingsBox.get(_key) ?? const SettingsModel();
  }

  void saveSettings(SettingsModel settings) {
    _settingsBox.put(_key, settings);
  }

  void clear() {
    _settingsBox.delete(_key);
  }
}
