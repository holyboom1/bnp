import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'merge_request_model.freezed.dart';
part 'merge_request_model.g.dart';

@freezed
@HiveType(typeId: 0)
class MergeRequestModel with _$MergeRequestModel {
  const factory MergeRequestModel({
    @HiveField(0) @Default(0) int id,
    @HiveField(1) @Default(0) int iid,
    @HiveField(2) @Default(0) @JsonKey(name: 'project_id') int projectId,
    @HiveField(3) @Default('') String title,
    @HiveField(4) @Default('') String description,
    @HiveField(5)
    @JsonKey(fromJson: MergeRequestState.fromString)
    @Default(MergeRequestState.unknown)
    MergeRequestState state,
    @HiveField(6) DateTime? created_at,
    @HiveField(7) DateTime? updated_at,
    @HiveField(8) DateTime? merged_at,
    @HiveField(9) DateTime? closed_at,
  }) = _MergeRequestModel;

  factory MergeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MergeRequestModelFromJson(json);
}

enum MergeRequestState {
  opened,
  closed,
  locked,
  merged,
  archived,
  unknown;

  static MergeRequestState fromString(String state) {
    switch (state) {
      case 'opened':
        return MergeRequestState.opened;
      case 'closed':
        return MergeRequestState.closed;
      case 'locked':
        return MergeRequestState.locked;
      case 'merged':
        return MergeRequestState.merged;
      case 'archived':
        return MergeRequestState.archived;
      default:
        return MergeRequestState.unknown;
    }
  }

  String toStringType() {
    switch (this) {
      case MergeRequestState.opened:
        return 'opened';
      case MergeRequestState.closed:
        return 'closed';
      case MergeRequestState.locked:
        return 'locked';
      case MergeRequestState.merged:
        return 'merged';
      case MergeRequestState.archived:
        return 'archived';
      default:
        return 'unknown';
    }
  }
}
