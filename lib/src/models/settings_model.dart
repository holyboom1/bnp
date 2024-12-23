import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
@HiveType(typeId: 1)
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    @HiveField(1) String? gitUrl,
    @HiveField(2) String? privateToken,
    @HiveField(3) @Default('main') String targetBranch,
    @HiveField(4) @Default(true) bool updateChangelogOnBuildByDefault,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => _$SettingsModelFromJson(json);
}
