// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettingsModel _$AppSettingsModelFromJson(Map<String, dynamic> json) {
  return _AppSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$AppSettingsModel {
  @HiveField(0)
  String? get gitLink => throw _privateConstructorUsedError;
  @HiveField(1)
  String get projectName => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get projectToken => throw _privateConstructorUsedError;
  @HiveField(3)
  String get targetBranch => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get projectId => throw _privateConstructorUsedError;
  @HiveField(5)
  String get changelogFile => throw _privateConstructorUsedError;
  @HiveField(6)
  bool get updateChangelogOnBuild => throw _privateConstructorUsedError;
  @HiveField(7)
  String get changelogCommitMessage => throw _privateConstructorUsedError;
  @HiveField(8)
  String get appIdInternal => throw _privateConstructorUsedError;
  @HiveField(9)
  String get appLocalPath => throw _privateConstructorUsedError;
  @HiveField(10)
  List<String> get flavors => throw _privateConstructorUsedError;
  @HiveField(11)
  List<String> get customBuildArgs => throw _privateConstructorUsedError;
  @HiveField(12)
  String get customBuildScriptPath => throw _privateConstructorUsedError;

  /// Serializes this AppSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsModelCopyWith<AppSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsModelCopyWith<$Res> {
  factory $AppSettingsModelCopyWith(
          AppSettingsModel value, $Res Function(AppSettingsModel) then) =
      _$AppSettingsModelCopyWithImpl<$Res, AppSettingsModel>;
  @useResult
  $Res call(
      {@HiveField(0) String? gitLink,
      @HiveField(1) String projectName,
      @HiveField(2) String? projectToken,
      @HiveField(3) String targetBranch,
      @HiveField(4) String? projectId,
      @HiveField(5) String changelogFile,
      @HiveField(6) bool updateChangelogOnBuild,
      @HiveField(7) String changelogCommitMessage,
      @HiveField(8) String appIdInternal,
      @HiveField(9) String appLocalPath,
      @HiveField(10) List<String> flavors,
      @HiveField(11) List<String> customBuildArgs,
      @HiveField(12) String customBuildScriptPath});
}

/// @nodoc
class _$AppSettingsModelCopyWithImpl<$Res, $Val extends AppSettingsModel>
    implements $AppSettingsModelCopyWith<$Res> {
  _$AppSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gitLink = freezed,
    Object? projectName = null,
    Object? projectToken = freezed,
    Object? targetBranch = null,
    Object? projectId = freezed,
    Object? changelogFile = null,
    Object? updateChangelogOnBuild = null,
    Object? changelogCommitMessage = null,
    Object? appIdInternal = null,
    Object? appLocalPath = null,
    Object? flavors = null,
    Object? customBuildArgs = null,
    Object? customBuildScriptPath = null,
  }) {
    return _then(_value.copyWith(
      gitLink: freezed == gitLink
          ? _value.gitLink
          : gitLink // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectToken: freezed == projectToken
          ? _value.projectToken
          : projectToken // ignore: cast_nullable_to_non_nullable
              as String?,
      targetBranch: null == targetBranch
          ? _value.targetBranch
          : targetBranch // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      changelogFile: null == changelogFile
          ? _value.changelogFile
          : changelogFile // ignore: cast_nullable_to_non_nullable
              as String,
      updateChangelogOnBuild: null == updateChangelogOnBuild
          ? _value.updateChangelogOnBuild
          : updateChangelogOnBuild // ignore: cast_nullable_to_non_nullable
              as bool,
      changelogCommitMessage: null == changelogCommitMessage
          ? _value.changelogCommitMessage
          : changelogCommitMessage // ignore: cast_nullable_to_non_nullable
              as String,
      appIdInternal: null == appIdInternal
          ? _value.appIdInternal
          : appIdInternal // ignore: cast_nullable_to_non_nullable
              as String,
      appLocalPath: null == appLocalPath
          ? _value.appLocalPath
          : appLocalPath // ignore: cast_nullable_to_non_nullable
              as String,
      flavors: null == flavors
          ? _value.flavors
          : flavors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customBuildArgs: null == customBuildArgs
          ? _value.customBuildArgs
          : customBuildArgs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customBuildScriptPath: null == customBuildScriptPath
          ? _value.customBuildScriptPath
          : customBuildScriptPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsModelImplCopyWith<$Res>
    implements $AppSettingsModelCopyWith<$Res> {
  factory _$$AppSettingsModelImplCopyWith(_$AppSettingsModelImpl value,
          $Res Function(_$AppSettingsModelImpl) then) =
      __$$AppSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? gitLink,
      @HiveField(1) String projectName,
      @HiveField(2) String? projectToken,
      @HiveField(3) String targetBranch,
      @HiveField(4) String? projectId,
      @HiveField(5) String changelogFile,
      @HiveField(6) bool updateChangelogOnBuild,
      @HiveField(7) String changelogCommitMessage,
      @HiveField(8) String appIdInternal,
      @HiveField(9) String appLocalPath,
      @HiveField(10) List<String> flavors,
      @HiveField(11) List<String> customBuildArgs,
      @HiveField(12) String customBuildScriptPath});
}

/// @nodoc
class __$$AppSettingsModelImplCopyWithImpl<$Res>
    extends _$AppSettingsModelCopyWithImpl<$Res, _$AppSettingsModelImpl>
    implements _$$AppSettingsModelImplCopyWith<$Res> {
  __$$AppSettingsModelImplCopyWithImpl(_$AppSettingsModelImpl _value,
      $Res Function(_$AppSettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gitLink = freezed,
    Object? projectName = null,
    Object? projectToken = freezed,
    Object? targetBranch = null,
    Object? projectId = freezed,
    Object? changelogFile = null,
    Object? updateChangelogOnBuild = null,
    Object? changelogCommitMessage = null,
    Object? appIdInternal = null,
    Object? appLocalPath = null,
    Object? flavors = null,
    Object? customBuildArgs = null,
    Object? customBuildScriptPath = null,
  }) {
    return _then(_$AppSettingsModelImpl(
      gitLink: freezed == gitLink
          ? _value.gitLink
          : gitLink // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectToken: freezed == projectToken
          ? _value.projectToken
          : projectToken // ignore: cast_nullable_to_non_nullable
              as String?,
      targetBranch: null == targetBranch
          ? _value.targetBranch
          : targetBranch // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      changelogFile: null == changelogFile
          ? _value.changelogFile
          : changelogFile // ignore: cast_nullable_to_non_nullable
              as String,
      updateChangelogOnBuild: null == updateChangelogOnBuild
          ? _value.updateChangelogOnBuild
          : updateChangelogOnBuild // ignore: cast_nullable_to_non_nullable
              as bool,
      changelogCommitMessage: null == changelogCommitMessage
          ? _value.changelogCommitMessage
          : changelogCommitMessage // ignore: cast_nullable_to_non_nullable
              as String,
      appIdInternal: null == appIdInternal
          ? _value.appIdInternal
          : appIdInternal // ignore: cast_nullable_to_non_nullable
              as String,
      appLocalPath: null == appLocalPath
          ? _value.appLocalPath
          : appLocalPath // ignore: cast_nullable_to_non_nullable
              as String,
      flavors: null == flavors
          ? _value._flavors
          : flavors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customBuildArgs: null == customBuildArgs
          ? _value._customBuildArgs
          : customBuildArgs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customBuildScriptPath: null == customBuildScriptPath
          ? _value.customBuildScriptPath
          : customBuildScriptPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingsModelImpl implements _AppSettingsModel {
  const _$AppSettingsModelImpl(
      {@HiveField(0) this.gitLink,
      @HiveField(1) this.projectName = 'APP',
      @HiveField(2) this.projectToken,
      @HiveField(3) this.targetBranch = 'main',
      @HiveField(4) this.projectId,
      @HiveField(5) this.changelogFile = 'CHANGELOG.md',
      @HiveField(6) this.updateChangelogOnBuild = true,
      @HiveField(7) this.changelogCommitMessage = 'update changelog',
      @HiveField(8) this.appIdInternal = '',
      @HiveField(9) this.appLocalPath = '',
      @HiveField(10) final List<String> flavors = const <String>[
        'dev',
        'stage',
        'preprod',
        'prod'
      ],
      @HiveField(11) final List<String> customBuildArgs = const <String>[],
      @HiveField(12) this.customBuildScriptPath = ''})
      : _flavors = flavors,
        _customBuildArgs = customBuildArgs;

  factory _$AppSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsModelImplFromJson(json);

  @override
  @HiveField(0)
  final String? gitLink;
  @override
  @JsonKey()
  @HiveField(1)
  final String projectName;
  @override
  @HiveField(2)
  final String? projectToken;
  @override
  @JsonKey()
  @HiveField(3)
  final String targetBranch;
  @override
  @HiveField(4)
  final String? projectId;
  @override
  @JsonKey()
  @HiveField(5)
  final String changelogFile;
  @override
  @JsonKey()
  @HiveField(6)
  final bool updateChangelogOnBuild;
  @override
  @JsonKey()
  @HiveField(7)
  final String changelogCommitMessage;
  @override
  @JsonKey()
  @HiveField(8)
  final String appIdInternal;
  @override
  @JsonKey()
  @HiveField(9)
  final String appLocalPath;
  final List<String> _flavors;
  @override
  @JsonKey()
  @HiveField(10)
  List<String> get flavors {
    if (_flavors is EqualUnmodifiableListView) return _flavors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flavors);
  }

  final List<String> _customBuildArgs;
  @override
  @JsonKey()
  @HiveField(11)
  List<String> get customBuildArgs {
    if (_customBuildArgs is EqualUnmodifiableListView) return _customBuildArgs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customBuildArgs);
  }

  @override
  @JsonKey()
  @HiveField(12)
  final String customBuildScriptPath;

  @override
  String toString() {
    return 'AppSettingsModel(gitLink: $gitLink, projectName: $projectName, projectToken: $projectToken, targetBranch: $targetBranch, projectId: $projectId, changelogFile: $changelogFile, updateChangelogOnBuild: $updateChangelogOnBuild, changelogCommitMessage: $changelogCommitMessage, appIdInternal: $appIdInternal, appLocalPath: $appLocalPath, flavors: $flavors, customBuildArgs: $customBuildArgs, customBuildScriptPath: $customBuildScriptPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsModelImpl &&
            (identical(other.gitLink, gitLink) || other.gitLink == gitLink) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectToken, projectToken) ||
                other.projectToken == projectToken) &&
            (identical(other.targetBranch, targetBranch) ||
                other.targetBranch == targetBranch) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.changelogFile, changelogFile) ||
                other.changelogFile == changelogFile) &&
            (identical(other.updateChangelogOnBuild, updateChangelogOnBuild) ||
                other.updateChangelogOnBuild == updateChangelogOnBuild) &&
            (identical(other.changelogCommitMessage, changelogCommitMessage) ||
                other.changelogCommitMessage == changelogCommitMessage) &&
            (identical(other.appIdInternal, appIdInternal) ||
                other.appIdInternal == appIdInternal) &&
            (identical(other.appLocalPath, appLocalPath) ||
                other.appLocalPath == appLocalPath) &&
            const DeepCollectionEquality().equals(other._flavors, _flavors) &&
            const DeepCollectionEquality()
                .equals(other._customBuildArgs, _customBuildArgs) &&
            (identical(other.customBuildScriptPath, customBuildScriptPath) ||
                other.customBuildScriptPath == customBuildScriptPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gitLink,
      projectName,
      projectToken,
      targetBranch,
      projectId,
      changelogFile,
      updateChangelogOnBuild,
      changelogCommitMessage,
      appIdInternal,
      appLocalPath,
      const DeepCollectionEquality().hash(_flavors),
      const DeepCollectionEquality().hash(_customBuildArgs),
      customBuildScriptPath);

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsModelImplCopyWith<_$AppSettingsModelImpl> get copyWith =>
      __$$AppSettingsModelImplCopyWithImpl<_$AppSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _AppSettingsModel implements AppSettingsModel {
  const factory _AppSettingsModel(
          {@HiveField(0) final String? gitLink,
          @HiveField(1) final String projectName,
          @HiveField(2) final String? projectToken,
          @HiveField(3) final String targetBranch,
          @HiveField(4) final String? projectId,
          @HiveField(5) final String changelogFile,
          @HiveField(6) final bool updateChangelogOnBuild,
          @HiveField(7) final String changelogCommitMessage,
          @HiveField(8) final String appIdInternal,
          @HiveField(9) final String appLocalPath,
          @HiveField(10) final List<String> flavors,
          @HiveField(11) final List<String> customBuildArgs,
          @HiveField(12) final String customBuildScriptPath}) =
      _$AppSettingsModelImpl;

  factory _AppSettingsModel.fromJson(Map<String, dynamic> json) =
      _$AppSettingsModelImpl.fromJson;

  @override
  @HiveField(0)
  String? get gitLink;
  @override
  @HiveField(1)
  String get projectName;
  @override
  @HiveField(2)
  String? get projectToken;
  @override
  @HiveField(3)
  String get targetBranch;
  @override
  @HiveField(4)
  String? get projectId;
  @override
  @HiveField(5)
  String get changelogFile;
  @override
  @HiveField(6)
  bool get updateChangelogOnBuild;
  @override
  @HiveField(7)
  String get changelogCommitMessage;
  @override
  @HiveField(8)
  String get appIdInternal;
  @override
  @HiveField(9)
  String get appLocalPath;
  @override
  @HiveField(10)
  List<String> get flavors;
  @override
  @HiveField(11)
  List<String> get customBuildArgs;
  @override
  @HiveField(12)
  String get customBuildScriptPath;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsModelImplCopyWith<_$AppSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
