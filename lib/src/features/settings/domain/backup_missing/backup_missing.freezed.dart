// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  List<String>? get mangasMissingSources => throw _privateConstructorUsedError;

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
  $Res call(
      {List<String>? missingSources,
      List<String>? missingTrackers,
      List<String>? mangasMissingSources});
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
    Object? mangasMissingSources = freezed,
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
      mangasMissingSources: freezed == mangasMissingSources
          ? _value.mangasMissingSources
          : mangasMissingSources // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BackupMissingImplCopyWith<$Res>
    implements $BackupMissingCopyWith<$Res> {
  factory _$$BackupMissingImplCopyWith(
          _$BackupMissingImpl value, $Res Function(_$BackupMissingImpl) then) =
      __$$BackupMissingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? missingSources,
      List<String>? missingTrackers,
      List<String>? mangasMissingSources});
}

/// @nodoc
class __$$BackupMissingImplCopyWithImpl<$Res>
    extends _$BackupMissingCopyWithImpl<$Res, _$BackupMissingImpl>
    implements _$$BackupMissingImplCopyWith<$Res> {
  __$$BackupMissingImplCopyWithImpl(
      _$BackupMissingImpl _value, $Res Function(_$BackupMissingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missingSources = freezed,
    Object? missingTrackers = freezed,
    Object? mangasMissingSources = freezed,
  }) {
    return _then(_$BackupMissingImpl(
      missingSources: freezed == missingSources
          ? _value._missingSources
          : missingSources // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      missingTrackers: freezed == missingTrackers
          ? _value._missingTrackers
          : missingTrackers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      mangasMissingSources: freezed == mangasMissingSources
          ? _value._mangasMissingSources
          : mangasMissingSources // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackupMissingImpl extends _BackupMissing {
  _$BackupMissingImpl(
      {final List<String>? missingSources,
      final List<String>? missingTrackers,
      final List<String>? mangasMissingSources})
      : _missingSources = missingSources,
        _missingTrackers = missingTrackers,
        _mangasMissingSources = mangasMissingSources,
        super._();

  factory _$BackupMissingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackupMissingImplFromJson(json);

  final List<String>? _missingSources;
  @override
  List<String>? get missingSources {
    final value = _missingSources;
    if (value == null) return null;
    if (_missingSources is EqualUnmodifiableListView) return _missingSources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _missingTrackers;
  @override
  List<String>? get missingTrackers {
    final value = _missingTrackers;
    if (value == null) return null;
    if (_missingTrackers is EqualUnmodifiableListView) return _missingTrackers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _mangasMissingSources;
  @override
  List<String>? get mangasMissingSources {
    final value = _mangasMissingSources;
    if (value == null) return null;
    if (_mangasMissingSources is EqualUnmodifiableListView)
      return _mangasMissingSources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BackupMissing(missingSources: $missingSources, missingTrackers: $missingTrackers, mangasMissingSources: $mangasMissingSources)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackupMissingImpl &&
            const DeepCollectionEquality()
                .equals(other._missingSources, _missingSources) &&
            const DeepCollectionEquality()
                .equals(other._missingTrackers, _missingTrackers) &&
            const DeepCollectionEquality()
                .equals(other._mangasMissingSources, _mangasMissingSources));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_missingSources),
      const DeepCollectionEquality().hash(_missingTrackers),
      const DeepCollectionEquality().hash(_mangasMissingSources));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BackupMissingImplCopyWith<_$BackupMissingImpl> get copyWith =>
      __$$BackupMissingImplCopyWithImpl<_$BackupMissingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackupMissingImplToJson(
      this,
    );
  }
}

abstract class _BackupMissing extends BackupMissing {
  factory _BackupMissing(
      {final List<String>? missingSources,
      final List<String>? missingTrackers,
      final List<String>? mangasMissingSources}) = _$BackupMissingImpl;
  _BackupMissing._() : super._();

  factory _BackupMissing.fromJson(Map<String, dynamic> json) =
      _$BackupMissingImpl.fromJson;

  @override
  List<String>? get missingSources;
  @override
  List<String>? get missingTrackers;
  @override
  List<String>? get mangasMissingSources;
  @override
  @JsonKey(ignore: true)
  _$$BackupMissingImplCopyWith<_$BackupMissingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
