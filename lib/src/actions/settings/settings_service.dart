import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:interact_cli/interact_cli.dart';
import 'package:uuid/uuid.dart';

import '../../data/providers/local/settings/app_settings_local_data_provider.dart';
import '../../data/providers/local/settings/settings_local_data_provider.dart';
import '../../di/app_di.dart';
import '../../models/app_settings_model.dart';
import '../../models/settings_model.dart';

class SettingsService {
  final List<AppSettingsModel> _appSettingsList = <AppSettingsModel>[];
  SettingsModel _settings = const SettingsModel();

  SettingsModel get settings {
    _settings = appLocator<SettingsHiveProvider>().getSettings();
    return _settings;
  }

  List<AppSettingsModel> get appSettingsList {
    _appSettingsList.clear();
    _appSettingsList.addAll(appLocator<AppSettingsHiveProvider>().getAppSettingsList());
    return _appSettingsList;
  }

  SettingsService() {
    init();
  }

  void updateDataModels() {
    _settings = appLocator<SettingsHiveProvider>().getSettings();
    _appSettingsList.clear();
    _appSettingsList.addAll(appLocator<AppSettingsHiveProvider>().getAppSettingsList());
  }

  void init() {
    updateDataModels();
    appLocator.registerLazySingleton<SettingsService>(
      () => this,
    );
  }

  Future<void> showSettings() async {
    // Ask user if  want to specify a path
    final int specifyOption = Select(
      prompt: 'Choose option:',
      options: <String>[
        'Global Settings',
        'App Settings',
        'Back to Main Menu',
      ],
    ).interact();

    switch (specifyOption) {
      case 0:
        await globalSettingsActions();
        break;
      case 1:
        await appSettingsActions();
        break;
      default:
        break;
    }
  }

  Future<void> globalSettingsActions() async {
    final settingsData = _settings.toJson();
    final List<String> settingsOptions = [];
    settingsOptions.add('Back to Main Menu');
    settingsOptions.addAll(settingsData.entries.map((e) => ' ${e.key}: ${e.value}').toList());
    final int globalSettingsOption = Select(
      prompt: 'Current Global Settings',
      options: settingsOptions,
    ).interact();

    switch (globalSettingsOption) {
      case 0:
        await showSettings();
        break;
      default:
        await setGlobalSettings(globalSettingsOption - 1);
        break;
    }
  }

  Future<void> setGlobalSettings(int settingIndex) async {
    final Map<String, dynamic> settingsJson = _settings.toJson();
    final String settingKey = _settings.toJson().keys.elementAt(settingIndex);
    final String settingValue = _settings.toJson().values.elementAt(settingIndex).toString();
    final String newSettingValue = Input(
      prompt: 'Enter new value for $settingKey',
      defaultValue: settingValue,
      initialText: settingValue,
    ).interact();
    settingsJson[settingKey] = newSettingValue;
    _settings = SettingsModel.fromJson(settingsJson);
    appLocator<SettingsHiveProvider>().saveSettings(_settings);
    await globalSettingsActions();
  }

  Future<void> appSettingsActions() async {
    final List<String> appSettingsOptions = [];
    appSettingsOptions.add('Back to Main Menu');
    appSettingsOptions.add('Add new App Settings');
    appSettingsOptions.add('Remove App Settings');
    final List<String> apps =
        _appSettingsList.map((AppSettingsModel e) => ' ${e.projectName}').toList();
    if (apps.isNotEmpty) {
      appSettingsOptions.addAll(apps);
    } else {
      appSettingsOptions.add('No Apps Configured');
    }
    final int appSettingsOption = Select(
      prompt: 'App Settings',
      options: appSettingsOptions,
    ).interact();

    switch (appSettingsOption) {
      case 0:
        await showSettings();
        break;
      case 1:
        await addNewAppSetting();
        break;
      case 2:
        await removeAppSetting();
        break;
      default:
        if (_appSettingsList.isEmpty) {
          await showSettings();
          return;
        }
        await setAppSettings(appSettingsOption - 3);
        break;
    }
  }

  Future<void> setAppSettings(int selectedApp) async {
    final AppSettingsModel appSettingsModel = _appSettingsList[selectedApp];
    final Map<String, dynamic> settingsJson = appSettingsModel.toJson();

    final List<String> options = settingsJson.entries.map((e) => ' ${e.key}: ${e.value}').toList();
    options.insert(0, 'Back to App Settings');
    final int settingIndex = Select(
      prompt: 'Current App Settings',
      options: options,
    ).interact();
    if (settingIndex == 0) {
      return appSettingsActions();
    }
    final String settingKey = appSettingsModel.toJson().keys.elementAt(settingIndex - 1);
    final String settingValue =
        appSettingsModel.toJson().values.elementAt(settingIndex - 1).toString();

    final String newSettingValue = Input(
            prompt: 'Enter new value for $settingKey',
            defaultValue: settingValue,
            initialText: settingValue)
        .interact();
    settingsJson[settingKey] = newSettingValue;
    _appSettingsList[selectedApp] = AppSettingsModel.fromJson(settingsJson);
    await appLocator<AppSettingsHiveProvider>().saveSettings(_appSettingsList[selectedApp]);
    await setAppSettings(selectedApp);
  }

  Future<void> addNewAppSetting() async {
    String path = Directory.current.path;
    final projectPath = Confirm(
      prompt: 'Is the project path $path?',
      defaultValue: true,
      waitForNewLine: true,
    ).interact();
    if (!projectPath) {
      path = Input(
        prompt: 'Enter Project Path:',
        initialText: path,
      ).interact();
    }

    final String projectName = Input(
      prompt: 'Enter Project Name',
      initialText: '',
    ).interact();
    final List<String> flavors = Input(
      prompt: 'Enter Flavors (comma separated)',
      initialText: 'prod,dev,stage',
    ).interact().split(',');

    final List<String> customBuildArgs = <String>[];
    void getAdditionalArg() {
      final String arg = ask('Enter additional build arg (leave empty to finish):');
      if (arg.isNotEmpty) {
        customBuildArgs.add(arg);
        getAdditionalArg();
      }
    }

    getAdditionalArg();

    final AppSettingsModel appSettingsModel = AppSettingsModel(
      projectName: projectName,
      flavors: flavors,
      customBuildArgs: customBuildArgs.join(' '),
      customBuildScriptPath: Input(
        prompt: 'Enter custom build script path',
      ).interact(),
      appLocalPath: path,
      changelogFile: Input(
        prompt: 'Enter Changelog File Name',
        initialText: 'CHANGELOG.md',
      ).interact(),
      changelogCommitMessage: Input(
        prompt: 'Enter Changelog Commit Message',
        initialText: 'chore: update changelog',
      ).interact(),
      projectToken: Input(
        prompt: 'Enter Git access token for this project (if null will use global settings token)',
      ).interact(),
      projectId: Input(
        prompt: 'Enter GitLab project ID (if null name should similar to project name in gitlab)',
        initialText: '1',
      ).interact(),
      gitLink: Input(
        prompt: 'Enter Git(GitLab) Link',
        initialText: 'https://gitlab.com/group/project',
      ).interact(),
      updateChangelogOnBuild: Confirm(
        prompt: 'Update Changelog on Build?',
        defaultValue: true,
        waitForNewLine: true,
      ).interact(),
      targetBranch: Input(
        prompt: 'Enter Target Branch',
        initialText: 'develop',
      ).interact(),
      appIdInternal: const Uuid().v4(),
    );
    _appSettingsList.add(appSettingsModel);
    await appLocator<AppSettingsHiveProvider>().saveSettings(appSettingsModel);
    updateDataModels();
    await appSettingsActions();
  }

  Future<void> removeAppSetting() async {
    final List<String> appSettingsOptions = [];
    appSettingsOptions.add('Back to Main Menu');
    appSettingsOptions
        .addAll(_appSettingsList.map((AppSettingsModel e) => ' ${e.projectName}').toList());
    final int appSettingsOption = Select(
      prompt: 'Remove App Settings',
      options: appSettingsOptions,
    ).interact();

    switch (appSettingsOption) {
      case 0:
        await appSettingsActions();
        break;
      default:
        await appLocator<AppSettingsHiveProvider>()
            .deleteSettings(_appSettingsList[appSettingsOption - 1].appIdInternal);
        updateDataModels();
        await appSettingsActions();
        break;
    }
  }

  AppSettingsModel? getCurrentApp() {
    AppSettingsModel? currentAppSettings;
    final String currentPath = Directory.current.path;
    final List<AppSettingsModel> appSettingsList = this.appSettingsList;
    for (final AppSettingsModel app in appSettingsList) {
      if (app.appLocalPath == currentPath) {
        currentAppSettings = app;
        break;
      }
    }

    if (currentAppSettings == null) {
      final List<String> appSettingsOptions = [];
      final List<String> apps =
          appSettingsList.map((AppSettingsModel e) => ' ${e.projectName}').toList();
      appSettingsOptions.add('Back to Main Menu');
      if (apps.isNotEmpty) {
        appSettingsOptions.addAll(apps);
      } else {
        appSettingsOptions.add('No Apps Configured');
      }
      final int appSettingsOption = Select(
        prompt: 'Select App to Update Changelog',
        options: appSettingsOptions,
      ).interact();
      switch (appSettingsOption) {
        case 0:
          return null;
        default:
          if (apps.isEmpty) {
            return null;
          }
          currentAppSettings = appSettingsList[appSettingsOption - 1];
          break;
      }
    }
    return currentAppSettings;
  }
}
