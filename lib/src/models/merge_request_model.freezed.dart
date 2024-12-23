// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merge_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MergeRequestModel _$MergeRequestModelFromJson(Map<String, dynamic> json) {
  return _MergeRequestModel.fromJson(json);
}

/// @nodoc
mixin _$MergeRequestModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int get iid => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'project_id')
  int get projectId => throw _privateConstructorUsedError;
  @HiveField(3)
  String get title => throw _privateConstructorUsedError;
  @HiveField(4)
  String get description => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(fromJson: MergeRequestState.fromString)
  MergeRequestState get state => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime? get created_at => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime? get updated_at => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime? get merged_at => throw _privateConstructorUsedError;
  @HiveField(9)
  DateTime? get closed_at => throw _privateConstructorUsedError;

  /// Serializes this MergeRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MergeRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MergeRequestModelCopyWith<MergeRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MergeRequestModelCopyWith<$Res> {
  factory $MergeRequestModelCopyWith(
          MergeRequestModel value, $Res Function(MergeRequestModel) then) =
      _$MergeRequestModelCopyWithImpl<$Res, MergeRequestModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) int iid,
      @HiveField(2) @JsonKey(name: 'project_id') int projectId,
      @HiveField(3) String title,
      @HiveField(4) String description,
      @HiveField(5)
      @JsonKey(fromJson: MergeRequestState.fromString)
      MergeRequestState state,
      @HiveField(6) DateTime? created_at,
      @HiveField(7) DateTime? updated_at,
      @HiveField(8) DateTime? merged_at,
      @HiveField(9) DateTime? closed_at});
}

/// @nodoc
class _$MergeRequestModelCopyWithImpl<$Res, $Val extends MergeRequestModel>
    implements $MergeRequestModelCopyWith<$Res> {
  _$MergeRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MergeRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? iid = null,
    Object? projectId = null,
    Object? title = null,
    Object? description = null,
    Object? state = null,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? merged_at = freezed,
    Object? closed_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      iid: null == iid
          ? _value.iid
          : iid // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as MergeRequestState,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      merged_at: freezed == merged_at
          ? _value.merged_at
          : merged_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closed_at: freezed == closed_at
          ? _value.closed_at
          : closed_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MergeRequestModelImplCopyWith<$Res>
    implements $MergeRequestModelCopyWith<$Res> {
  factory _$$MergeRequestModelImplCopyWith(_$MergeRequestModelImpl value,
          $Res Function(_$MergeRequestModelImpl) then) =
      __$$MergeRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) int iid,
      @HiveField(2) @JsonKey(name: 'project_id') int projectId,
      @HiveField(3) String title,
      @HiveField(4) String description,
      @HiveField(5)
      @JsonKey(fromJson: MergeRequestState.fromString)
      MergeRequestState state,
      @HiveField(6) DateTime? created_at,
      @HiveField(7) DateTime? updated_at,
      @HiveField(8) DateTime? merged_at,
      @HiveField(9) DateTime? closed_at});
}

/// @nodoc
class __$$MergeRequestModelImplCopyWithImpl<$Res>
    extends _$MergeRequestModelCopyWithImpl<$Res, _$MergeRequestModelImpl>
    implements _$$MergeRequestModelImplCopyWith<$Res> {
  __$$MergeRequestModelImplCopyWithImpl(_$MergeRequestModelImpl _value,
      $Res Function(_$MergeRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MergeRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? iid = null,
    Object? projectId = null,
    Object? title = null,
    Object? description = null,
    Object? state = null,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? merged_at = freezed,
    Object? closed_at = freezed,
  }) {
    return _then(_$MergeRequestModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      iid: null == iid
          ? _value.iid
          : iid // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as MergeRequestState,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      merged_at: freezed == merged_at
          ? _value.merged_at
          : merged_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closed_at: freezed == closed_at
          ? _value.closed_at
          : closed_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MergeRequestModelImpl implements _MergeRequestModel {
  const _$MergeRequestModelImpl(
      {@HiveField(0) this.id = 0,
      @HiveField(1) this.iid = 0,
      @HiveField(2) @JsonKey(name: 'project_id') this.projectId = 0,
      @HiveField(3) this.title = '',
      @HiveField(4) this.description = '',
      @HiveField(5)
      @JsonKey(fromJson: MergeRequestState.fromString)
      this.state = MergeRequestState.unknown,
      @HiveField(6) this.created_at,
      @HiveField(7) this.updated_at,
      @HiveField(8) this.merged_at,
      @HiveField(9) this.closed_at});

  factory _$MergeRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MergeRequestModelImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final int id;
  @override
  @JsonKey()
  @HiveField(1)
  final int iid;
  @override
  @HiveField(2)
  @JsonKey(name: 'project_id')
  final int projectId;
  @override
  @JsonKey()
  @HiveField(3)
  final String title;
  @override
  @JsonKey()
  @HiveField(4)
  final String description;
  @override
  @HiveField(5)
  @JsonKey(fromJson: MergeRequestState.fromString)
  final MergeRequestState state;
  @override
  @HiveField(6)
  final DateTime? created_at;
  @override
  @HiveField(7)
  final DateTime? updated_at;
  @override
  @HiveField(8)
  final DateTime? merged_at;
  @override
  @HiveField(9)
  final DateTime? closed_at;

  @override
  String toString() {
    return 'MergeRequestModel(id: $id, iid: $iid, projectId: $projectId, title: $title, description: $description, state: $state, created_at: $created_at, updated_at: $updated_at, merged_at: $merged_at, closed_at: $closed_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MergeRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.iid, iid) || other.iid == iid) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.merged_at, merged_at) ||
                other.merged_at == merged_at) &&
            (identical(other.closed_at, closed_at) ||
                other.closed_at == closed_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, iid, projectId, title,
      description, state, created_at, updated_at, merged_at, closed_at);

  /// Create a copy of MergeRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MergeRequestModelImplCopyWith<_$MergeRequestModelImpl> get copyWith =>
      __$$MergeRequestModelImplCopyWithImpl<_$MergeRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MergeRequestModelImplToJson(
      this,
    );
  }
}

abstract class _MergeRequestModel implements MergeRequestModel {
  const factory _MergeRequestModel(
      {@HiveField(0) final int id,
      @HiveField(1) final int iid,
      @HiveField(2) @JsonKey(name: 'project_id') final int projectId,
      @HiveField(3) final String title,
      @HiveField(4) final String description,
      @HiveField(5)
      @JsonKey(fromJson: MergeRequestState.fromString)
      final MergeRequestState state,
      @HiveField(6) final DateTime? created_at,
      @HiveField(7) final DateTime? updated_at,
      @HiveField(8) final DateTime? merged_at,
      @HiveField(9) final DateTime? closed_at}) = _$MergeRequestModelImpl;

  factory _MergeRequestModel.fromJson(Map<String, dynamic> json) =
      _$MergeRequestModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  int get iid;
  @override
  @HiveField(2)
  @JsonKey(name: 'project_id')
  int get projectId;
  @override
  @HiveField(3)
  String get title;
  @override
  @HiveField(4)
  String get description;
  @override
  @HiveField(5)
  @JsonKey(fromJson: MergeRequestState.fromString)
  MergeRequestState get state;
  @override
  @HiveField(6)
  DateTime? get created_at;
  @override
  @HiveField(7)
  DateTime? get updated_at;
  @override
  @HiveField(8)
  DateTime? get merged_at;
  @override
  @HiveField(9)
  DateTime? get closed_at;

  /// Create a copy of MergeRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MergeRequestModelImplCopyWith<_$MergeRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
