import 'dart:async';

import 'package:get_it/get_it.dart';

import '../data/config/network/dio_config.dart';
import '../data/providers/local/hive_provider.dart';
import '../data/providers/local/hive_provider_impl.dart';
import '../data/providers/local/settings/app_settings_local_data_provider.dart';
import '../data/providers/local/settings/settings_local_data_provider.dart';

final GetIt appLocator = GetIt.instance;

Future<void> setupDi() async {
  await initDB();
  initNetwork();
}

Future<void> initDB() async {
  appLocator.registerLazySingleton<HiveProvider>(
    HiveProviderImpl.new,
  );
  await appLocator<HiveProvider>().init();
  appLocator.registerLazySingleton<SettingsHiveProvider>(
    () => SettingsHiveProvider(
      appLocator<HiveProvider>().settingsBox,
    ),
  );
  appLocator.registerLazySingleton<AppSettingsHiveProvider>(
    () => AppSettingsHiveProvider(appLocator<HiveProvider>().appSettingsBox),
  );
}

void initNetwork() {
  appLocator.registerLazySingleton<DioConfig>(
    () {
      return DioConfig();
    },
  );
}
