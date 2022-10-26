// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'backup_missing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BackupMissing _$BackupMissingFromJson(Map<String, dynamic> json) {
  return _BackupMissing.fromJson(json);
}

/// @nodoc
mixin _$BackupMissing {
  List<String>? get missingSources => throw _privateConstructorUsedError;
  List<String>? get missingTrackers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BackupMissingCopyWith<BackupMissing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupMissingCopyWith<$Res> {
  factory $BackupMissingCopyWith(
          BackupMissing value, $Res Function(BackupMissing) then) =
      _$BackupMissingCopyWithImpl<$Res, BackupMissing>;
  @useResult
  $Res call({List<String>? missingSources, List<String>? missingTrackers});
}

/// @nodoc
class _$BackupMissingCopyWithImpl<$Res, $Val extends BackupMissing>
    implements $BackupMissingCopyWith<$Res> {
  _$BackupMissingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missingSources = freezed,
    Object? missingTrackers = freezed,
  }) {
    return _then(_value.copyWith(
      missingSources: freezed == missingSources
          ? _value.missingSources
          : missingSources // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      missingTrackers: freezed == missingTrackers
          ? _value.missingTrackers
          : missingTrackers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BackupMissingCopyWith<$Res>
    implements $BackupMissingCopyWith<$Res> {
  factory _$$_BackupMissingCopyWith(
          _$_BackupMissing value, $Res Function(_$_BackupMissing) then) =
      __$$_BackupMissingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? missingSources, List<String>? missingTrackers});
}

/// @nodoc
class __$$_BackupMissingCopyWithImpl<$Res>
    extends _$BackupMissingCopyWithImpl<$Res, _$_BackupMissing>
    implements _$$_BackupMissingCopyWith<$Res> {
  __$$_BackupMissingCopyWithImpl(
      _$_BackupMissing _value, $Res Function(_$_BackupMissing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missingSources = freezed,
    Object? missingTrackers = freezed,
  }) {
    return _then(_$_BackupMissing(
      missingSources: freezed == missingSources
          ? _value._missingSources
          : missingSources // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      missingTrackers: freezed == missingTrackers
          ? _value._missingTrackers
          : missingTrackers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BackupMissing extends _BackupMissing {
  _$_BackupMissing(
      {final List<String>? missingSources, final List<String>? missingTrackers})
      : _missingSources = missingSources,
        _missingTrackers = missingTrackers,
        super._();

  factory _$_BackupMissing.fromJson(Map<String, dynamic> json) =>
      _$$_BackupMissingFromJson(json);

  final List<String>? _missingSources;
  @override
  List<String>? get missingSources {
    final value = _missingSources;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _missingTrackers;
  @override
  List<String>? get missingTrackers {
    final value = _missingTrackers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BackupMissing(missingSources: $missingSources, missingTrackers: $missingTrackers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BackupMissing &&
            const DeepCollectionEquality()
                .equals(other._missingSources, _missingSources) &&
            const DeepCollectionEquality()
                .equals(other._missingTrackers, _missingTrackers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_missingSources),
      const DeepCollectionEquality().hash(_missingTrackers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BackupMissingCopyWith<_$_BackupMissing> get copyWith =>
      __$$_BackupMissingCopyWithImpl<_$_BackupMissing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BackupMissingToJson(
      this,
    );
  }
}

abstract class _BackupMissing extends BackupMissing {
  factory _BackupMissing(
      {final List<String>? missingSources,
      final List<String>? missingTrackers}) = _$_BackupMissing;
  _BackupMissing._() : super._();

  factory _BackupMissing.fromJson(Map<String, dynamic> json) =
      _$_BackupMissing.fromJson;

  @override
  List<String>? get missingSources;
  @override
  List<String>? get missingTrackers;
  @override
  @JsonKey(ignore: true)
  _$$_BackupMissingCopyWith<_$_BackupMissing> get copyWith =>
      throw _privateConstructorUsedError;
}
