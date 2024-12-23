// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsModelAdapter extends TypeAdapter<SettingsModel> {
  @override
  final int typeId = 1;

  @override
  SettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModel(
      gitUrl: fields[1] as String?,
      privateToken: fields[2] as String?,
      targetBranch: fields[3] as String,
      updateChangelogOnBuildByDefault: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.gitUrl)
      ..writeByte(2)
      ..write(obj.privateToken)
      ..writeByte(3)
      ..write(obj.targetBranch)
      ..writeByte(4)
      ..write(obj.updateChangelogOnBuildByDefault);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsModelImpl _$$SettingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingsModelImpl(
      gitUrl: json['gitUrl'] as String?,
      privateToken: json['privateToken'] as String?,
      targetBranch: json['targetBranch'] as String? ?? 'main',
      updateChangelogOnBuildByDefault:
          json['updateChangelogOnBuildByDefault'] as bool? ?? true,
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'gitUrl': instance.gitUrl,
      'privateToken': instance.privateToken,
      'targetBranch': instance.targetBranch,
      'updateChangelogOnBuildByDefault':
          instance.updateChangelogOnBuildByDefault,
    };
