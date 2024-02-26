// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AboutDto {
  String? get name => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get revision => throw _privateConstructorUsedError;
  String? get buildType => throw _privateConstructorUsedError;
  int? get buildTime => throw _privateConstructorUsedError;
  String? get github => throw _privateConstructorUsedError;
  String? get discord => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AboutDtoCopyWith<AboutDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutDtoCopyWith<$Res> {
  factory $AboutDtoCopyWith(AboutDto value, $Res Function(AboutDto) then) =
      _$AboutDtoCopyWithImpl<$Res, AboutDto>;
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
class _$AboutDtoCopyWithImpl<$Res, $Val extends AboutDto>
    implements $AboutDtoCopyWith<$Res> {
  _$AboutDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$AboutDtoImplCopyWith<$Res>
    implements $AboutDtoCopyWith<$Res> {
  factory _$$AboutDtoImplCopyWith(
          _$AboutDtoImpl value, $Res Function(_$AboutDtoImpl) then) =
      __$$AboutDtoImplCopyWithImpl<$Res>;
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
class __$$AboutDtoImplCopyWithImpl<$Res>
    extends _$AboutDtoCopyWithImpl<$Res, _$AboutDtoImpl>
    implements _$$AboutDtoImplCopyWith<$Res> {
  __$$AboutDtoImplCopyWithImpl(
      _$AboutDtoImpl _value, $Res Function(_$AboutDtoImpl) _then)
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
    return _then(_$AboutDtoImpl(
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

class _$AboutDtoImpl extends _AboutDto {
  const _$AboutDtoImpl(
      {this.name,
      this.version,
      this.revision,
      this.buildType,
      this.buildTime,
      this.github,
      this.discord})
      : super._();

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
    return 'AboutDto(name: $name, version: $version, revision: $revision, buildType: $buildType, buildTime: $buildTime, github: $github, discord: $discord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutDtoImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, name, version, revision,
      buildType, buildTime, github, discord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutDtoImplCopyWith<_$AboutDtoImpl> get copyWith =>
      __$$AboutDtoImplCopyWithImpl<_$AboutDtoImpl>(this, _$identity);
}

abstract class _AboutDto extends AboutDto {
  const factory _AboutDto(
      {final String? name,
      final String? version,
      final String? revision,
      final String? buildType,
      final int? buildTime,
      final String? github,
      final String? discord}) = _$AboutDtoImpl;
  const _AboutDto._() : super._();

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
  _$$AboutDtoImplCopyWith<_$AboutDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
