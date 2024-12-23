import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'app_settings_model.freezed.dart';
part 'app_settings_model.g.dart';

@freezed
@HiveType(typeId: 0)
class AppSettingsModel with _$AppSettingsModel {
  const factory AppSettingsModel({
    @HiveField(0) String? gitLink,
    @HiveField(1) @Default('APP') String projectName,
    @HiveField(2) String? projectToken,
    @HiveField(3) @Default('main') String targetBranch,
    @HiveField(4) String? projectId,
    @HiveField(5) @Default('CHANGELOG.md') String changelogFile,
    @HiveField(6) @Default(true) bool updateChangelogOnBuild,
    @HiveField(7) @Default('update changelog') String changelogCommitMessage,
    @HiveField(8) @Default('') String appIdInternal,
    @HiveField(9) @Default('') String appLocalPath,
    @HiveField(10) @Default(<String>['dev', 'stage', 'preprod', 'prod']) List<String> flavors,
    @HiveField(11) @Default('') String customBuildArgs,
    @HiveField(12) @Default('') String customBuildScriptPath,
  }) = _AppSettingsModel;

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) => _$AppSettingsModelFromJson(json);
}
