// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) {
  return _SettingsModel.fromJson(json);
}

/// @nodoc
mixin _$SettingsModel {
  @HiveField(1)
  String? get gitUrl => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get privateToken => throw _privateConstructorUsedError;
  @HiveField(3)
  String get targetBranch => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get updateChangelogOnBuildByDefault =>
      throw _privateConstructorUsedError;

  /// Serializes this SettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
          SettingsModel value, $Res Function(SettingsModel) then) =
      _$SettingsModelCopyWithImpl<$Res, SettingsModel>;
  @useResult
  $Res call(
      {@HiveField(1) String? gitUrl,
      @HiveField(2) String? privateToken,
      @HiveField(3) String targetBranch,
      @HiveField(4) bool updateChangelogOnBuildByDefault});
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res, $Val extends SettingsModel>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gitUrl = freezed,
    Object? privateToken = freezed,
    Object? targetBranch = null,
    Object? updateChangelogOnBuildByDefault = null,
  }) {
    return _then(_value.copyWith(
      gitUrl: freezed == gitUrl
          ? _value.gitUrl
          : gitUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      privateToken: freezed == privateToken
          ? _value.privateToken
          : privateToken // ignore: cast_nullable_to_non_nullable
              as String?,
      targetBranch: null == targetBranch
          ? _value.targetBranch
          : targetBranch // ignore: cast_nullable_to_non_nullable
              as String,
      updateChangelogOnBuildByDefault: null == updateChangelogOnBuildByDefault
          ? _value.updateChangelogOnBuildByDefault
          : updateChangelogOnBuildByDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsModelImplCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$$SettingsModelImplCopyWith(
          _$SettingsModelImpl value, $Res Function(_$SettingsModelImpl) then) =
      __$$SettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String? gitUrl,
      @HiveField(2) String? privateToken,
      @HiveField(3) String targetBranch,
      @HiveField(4) bool updateChangelogOnBuildByDefault});
}

/// @nodoc
class __$$SettingsModelImplCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res, _$SettingsModelImpl>
    implements _$$SettingsModelImplCopyWith<$Res> {
  __$$SettingsModelImplCopyWithImpl(
      _$SettingsModelImpl _value, $Res Function(_$SettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gitUrl = freezed,
    Object? privateToken = freezed,
    Object? targetBranch = null,
    Object? updateChangelogOnBuildByDefault = null,
  }) {
    return _then(_$SettingsModelImpl(
      gitUrl: freezed == gitUrl
          ? _value.gitUrl
          : gitUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      privateToken: freezed == privateToken
          ? _value.privateToken
          : privateToken // ignore: cast_nullable_to_non_nullable
              as String?,
      targetBranch: null == targetBranch
          ? _value.targetBranch
          : targetBranch // ignore: cast_nullable_to_non_nullable
              as String,
      updateChangelogOnBuildByDefault: null == updateChangelogOnBuildByDefault
          ? _value.updateChangelogOnBuildByDefault
          : updateChangelogOnBuildByDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsModelImpl implements _SettingsModel {
  const _$SettingsModelImpl(
      {@HiveField(1) this.gitUrl,
      @HiveField(2) this.privateToken,
      @HiveField(3) this.targetBranch = 'main',
      @HiveField(4) this.updateChangelogOnBuildByDefault = true});

  factory _$SettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsModelImplFromJson(json);

  @override
  @HiveField(1)
  final String? gitUrl;
  @override
  @HiveField(2)
  final String? privateToken;
  @override
  @JsonKey()
  @HiveField(3)
  final String targetBranch;
  @override
  @JsonKey()
  @HiveField(4)
  final bool updateChangelogOnBuildByDefault;

  @override
  String toString() {
    return 'SettingsModel(gitUrl: $gitUrl, privateToken: $privateToken, targetBranch: $targetBranch, updateChangelogOnBuildByDefault: $updateChangelogOnBuildByDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsModelImpl &&
            (identical(other.gitUrl, gitUrl) || other.gitUrl == gitUrl) &&
            (identical(other.privateToken, privateToken) ||
                other.privateToken == privateToken) &&
            (identical(other.targetBranch, targetBranch) ||
                other.targetBranch == targetBranch) &&
            (identical(other.updateChangelogOnBuildByDefault,
                    updateChangelogOnBuildByDefault) ||
                other.updateChangelogOnBuildByDefault ==
                    updateChangelogOnBuildByDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gitUrl, privateToken,
      targetBranch, updateChangelogOnBuildByDefault);

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      __$$SettingsModelImplCopyWithImpl<_$SettingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsModelImplToJson(
      this,
    );
  }
}

abstract class _SettingsModel implements SettingsModel {
  const factory _SettingsModel(
          {@HiveField(1) final String? gitUrl,
          @HiveField(2) final String? privateToken,
          @HiveField(3) final String targetBranch,
          @HiveField(4) final bool updateChangelogOnBuildByDefault}) =
      _$SettingsModelImpl;

  factory _SettingsModel.fromJson(Map<String, dynamic> json) =
      _$SettingsModelImpl.fromJson;

  @override
  @HiveField(1)
  String? get gitUrl;
  @override
  @HiveField(2)
  String? get privateToken;
  @override
  @HiveField(3)
  String get targetBranch;
  @override
  @HiveField(4)
  bool get updateChangelogOnBuildByDefault;

  /// Create a copy of SettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsModelImplCopyWith<_$SettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}