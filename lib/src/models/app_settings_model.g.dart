// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingsModelAdapter extends TypeAdapter<AppSettingsModel> {
  @override
  final int typeId = 0;

  @override
  AppSettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettingsModel(
      gitLink: fields[0] as String?,
      projectName: fields[1] as String,
      projectToken: fields[2] as String?,
      targetBranch: fields[3] as String,
      projectId: fields[4] as String?,
      changelogFile: fields[5] as String,
      updateChangelogOnBuild: fields[6] as bool,
      changelogCommitMessage: fields[7] as String,
      appIdInternal: fields[8] as String,
      appLocalPath: fields[9] as String,
      flavors: (fields[10] as List).cast<String>(),
      customBuildArgs: (fields[11] as List).cast<String>(),
      customBuildScriptPath: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppSettingsModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.gitLink)
      ..writeByte(1)
      ..write(obj.projectName)
      ..writeByte(2)
      ..write(obj.projectToken)
      ..writeByte(3)
      ..write(obj.targetBranch)
      ..writeByte(4)
      ..write(obj.projectId)
      ..writeByte(5)
      ..write(obj.changelogFile)
      ..writeByte(6)
      ..write(obj.updateChangelogOnBuild)
      ..writeByte(7)
      ..write(obj.changelogCommitMessage)
      ..writeByte(8)
      ..write(obj.appIdInternal)
      ..writeByte(9)
      ..write(obj.appLocalPath)
      ..writeByte(10)
      ..write(obj.flavors)
      ..writeByte(11)
      ..write(obj.customBuildArgs)
      ..writeByte(12)
      ..write(obj.customBuildScriptPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsModelImpl _$$AppSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingsModelImpl(
      gitLink: json['gitLink'] as String?,
      projectName: json['projectName'] as String? ?? 'APP',
      projectToken: json['projectToken'] as String?,
      targetBranch: json['targetBranch'] as String? ?? 'main',
      projectId: json['projectId'] as String?,
      changelogFile: json['changelogFile'] as String? ?? 'CHANGELOG.md',
      updateChangelogOnBuild: json['updateChangelogOnBuild'] as bool? ?? true,
      changelogCommitMessage:
          json['changelogCommitMessage'] as String? ?? 'update changelog',
      appIdInternal: json['appIdInternal'] as String? ?? '',
      appLocalPath: json['appLocalPath'] as String? ?? '',
      flavors: (json['flavors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>['dev', 'stage', 'preprod', 'prod'],
      customBuildArgs: (json['customBuildArgs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      customBuildScriptPath: json['customBuildScriptPath'] as String? ?? '',
    );

Map<String, dynamic> _$$AppSettingsModelImplToJson(
        _$AppSettingsModelImpl instance) =>
    <String, dynamic>{
      'gitLink': instance.gitLink,
      'projectName': instance.projectName,
      'projectToken': instance.projectToken,
      'targetBranch': instance.targetBranch,
      'projectId': instance.projectId,
      'changelogFile': instance.changelogFile,
      'updateChangelogOnBuild': instance.updateChangelogOnBuild,
      'changelogCommitMessage': instance.changelogCommitMessage,
      'appIdInternal': instance.appIdInternal,
      'appLocalPath': instance.appLocalPath,
      'flavors': instance.flavors,
      'customBuildArgs': instance.customBuildArgs,
      'customBuildScriptPath': instance.customBuildScriptPath,
    };
