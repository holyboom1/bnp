// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_request_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MergeRequestModelAdapter extends TypeAdapter<MergeRequestModel> {
  @override
  final int typeId = 0;

  @override
  MergeRequestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MergeRequestModel(
      id: (fields[0] as num).toInt(),
      iid: (fields[1] as num).toInt(),
      projectId: (fields[2] as num).toInt(),
      title: fields[3] as String,
      description: fields[4] as String,
      state: fields[5] as MergeRequestState,
      created_at: fields[6] as DateTime?,
      updated_at: fields[7] as DateTime?,
      merged_at: fields[8] as DateTime?,
      closed_at: fields[9] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, MergeRequestModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.iid)
      ..writeByte(2)
      ..write(obj.projectId)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.created_at)
      ..writeByte(7)
      ..write(obj.updated_at)
      ..writeByte(8)
      ..write(obj.merged_at)
      ..writeByte(9)
      ..write(obj.closed_at);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MergeRequestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MergeRequestModelImpl _$$MergeRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MergeRequestModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      iid: (json['iid'] as num?)?.toInt() ?? 0,
      projectId: (json['project_id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      state: json['state'] == null
          ? MergeRequestState.unknown
          : MergeRequestState.fromString(json['state'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      merged_at: json['merged_at'] == null
          ? null
          : DateTime.parse(json['merged_at'] as String),
      closed_at: json['closed_at'] == null
          ? null
          : DateTime.parse(json['closed_at'] as String),
    );

Map<String, dynamic> _$$MergeRequestModelImplToJson(
        _$MergeRequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iid': instance.iid,
      'project_id': instance.projectId,
      'title': instance.title,
      'description': instance.description,
      'state': _$MergeRequestStateEnumMap[instance.state]!,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'merged_at': instance.merged_at?.toIso8601String(),
      'closed_at': instance.closed_at?.toIso8601String(),
    };

const _$MergeRequestStateEnumMap = {
  MergeRequestState.opened: 'opened',
  MergeRequestState.closed: 'closed',
  MergeRequestState.locked: 'locked',
  MergeRequestState.merged: 'merged',
  MergeRequestState.archived: 'archived',
  MergeRequestState.unknown: 'unknown',
};
