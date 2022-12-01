// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

About _$AboutFromJson(Map<String, dynamic> json) {
  return _About.fromJson(json);
}

/// @nodoc
mixin _$About {
  String? get name => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get revision => throw _privateConstructorUsedError;
  String? get buildType => throw _privateConstructorUsedError;
  int? get buildTime => throw _privateConstructorUsedError;
  String? get github => throw _privateConstructorUsedError;
  String? get discord => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AboutCopyWith<About> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutCopyWith<$Res> {
  factory $AboutCopyWith(About value, $Res Function(About) then) =
      _$AboutCopyWithImpl<$Res, About>;
  @useResult
  $Res call(
      {String? name,
      String? version,
      String? revision,
      String? buildType,
      int? buildTime,
      String? github,
      String? discord});
}

/// @nodoc
class _$AboutCopyWithImpl<$Res, $Val extends About>
    implements $AboutCopyWith<$Res> {
  _$AboutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? version = freezed,
    Object? revision = freezed,
    Object? buildType = freezed,
    Object? buildTime = freezed,
    Object? github = freezed,
    Object? discord = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      revision: freezed == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as String?,
      buildType: freezed == buildType
          ? _value.buildType
          : buildType // ignore: cast_nullable_to_non_nullable
              as String?,
      buildTime: freezed == buildTime
          ? _value.buildTime
          : buildTime // ignore: cast_nullable_to_non_nullable
              as int?,
      github: freezed == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String?,
      discord: freezed == discord
          ? _value.discord
          : discord // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AboutCopyWith<$Res> implements $AboutCopyWith<$Res> {
  factory _$$_AboutCopyWith(_$_About value, $Res Function(_$_About) then) =
      __$$_AboutCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? version,
      String? revision,
      String? buildType,
      int? buildTime,
      String? github,
      String? discord});
}

/// @nodoc
class __$$_AboutCopyWithImpl<$Res> extends _$AboutCopyWithImpl<$Res, _$_About>
    implements _$$_AboutCopyWith<$Res> {
  __$$_AboutCopyWithImpl(_$_About _value, $Res Function(_$_About) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? version = freezed,
    Object? revision = freezed,
    Object? buildType = freezed,
    Object? buildTime = freezed,
    Object? github = freezed,
    Object? discord = freezed,
  }) {
    return _then(_$_About(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      revision: freezed == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as String?,
      buildType: freezed == buildType
          ? _value.buildType
          : buildType // ignore: cast_nullable_to_non_nullable
              as String?,
      buildTime: freezed == buildTime
          ? _value.buildTime
          : buildTime // ignore: cast_nullable_to_non_nullable
              as int?,
      github: freezed == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String?,
      discord: freezed == discord
          ? _value.discord
          : discord // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_About implements _About {
  const _$_About(
      {this.name,
      this.version,
      this.revision,
      this.buildType,
      this.buildTime,
      this.github,
      this.discord});

  factory _$_About.fromJson(Map<String, dynamic> json) =>
      _$$_AboutFromJson(json);

  @override
  final String? name;
  @override
  final String? version;
  @override
  final String? revision;
  @override
  final String? buildType;
  @override
  final int? buildTime;
  @override
  final String? github;
  @override
  final String? discord;

  @override
  String toString() {
    return 'About(name: $name, version: $version, revision: $revision, buildType: $buildType, buildTime: $buildTime, github: $github, discord: $discord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_About &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.revision, revision) ||
                other.revision == revision) &&
            (identical(other.buildType, buildType) ||
                other.buildType == buildType) &&
            (identical(other.buildTime, buildTime) ||
                other.buildTime == buildTime) &&
            (identical(other.github, github) || other.github == github) &&
            (identical(other.discord, discord) || other.discord == discord));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, version, revision,
      buildType, buildTime, github, discord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AboutCopyWith<_$_About> get copyWith =>
      __$$_AboutCopyWithImpl<_$_About>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AboutToJson(
      this,
    );
  }
}

abstract class _About implements About {
  const factory _About(
      {final String? name,
      final String? version,
      final String? revision,
      final String? buildType,
      final int? buildTime,
      final String? github,
      final String? discord}) = _$_About;

  factory _About.fromJson(Map<String, dynamic> json) = _$_About.fromJson;

  @override
  String? get name;
  @override
  String? get version;
  @override
  String? get revision;
  @override
  String? get buildType;
  @override
  int? get buildTime;
  @override
  String? get github;
  @override
  String? get discord;
  @override
  @JsonKey(ignore: true)
  _$$_AboutCopyWith<_$_About> get copyWith =>
      throw _privateConstructorUsedError;
}
