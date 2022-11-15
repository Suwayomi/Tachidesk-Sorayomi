// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chapter_batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChapterBatch _$ChapterBatchFromJson(Map<String, dynamic> json) {
  return _ChapterBatch.fromJson(json);
}

/// @nodoc
mixin _$ChapterBatch {
  List<int>? get chapterIds => throw _privateConstructorUsedError;
  ChapterChange? get change => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterBatchCopyWith<ChapterBatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterBatchCopyWith<$Res> {
  factory $ChapterBatchCopyWith(
          ChapterBatch value, $Res Function(ChapterBatch) then) =
      _$ChapterBatchCopyWithImpl<$Res, ChapterBatch>;
  @useResult
  $Res call({List<int>? chapterIds, ChapterChange? change});

  $ChapterChangeCopyWith<$Res>? get change;
}

/// @nodoc
class _$ChapterBatchCopyWithImpl<$Res, $Val extends ChapterBatch>
    implements $ChapterBatchCopyWith<$Res> {
  _$ChapterBatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapterIds = freezed,
    Object? change = freezed,
  }) {
    return _then(_value.copyWith(
      chapterIds: freezed == chapterIds
          ? _value.chapterIds
          : chapterIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      change: freezed == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as ChapterChange?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChapterChangeCopyWith<$Res>? get change {
    if (_value.change == null) {
      return null;
    }

    return $ChapterChangeCopyWith<$Res>(_value.change!, (value) {
      return _then(_value.copyWith(change: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChapterBatchCopyWith<$Res>
    implements $ChapterBatchCopyWith<$Res> {
  factory _$$_ChapterBatchCopyWith(
          _$_ChapterBatch value, $Res Function(_$_ChapterBatch) then) =
      __$$_ChapterBatchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int>? chapterIds, ChapterChange? change});

  @override
  $ChapterChangeCopyWith<$Res>? get change;
}

/// @nodoc
class __$$_ChapterBatchCopyWithImpl<$Res>
    extends _$ChapterBatchCopyWithImpl<$Res, _$_ChapterBatch>
    implements _$$_ChapterBatchCopyWith<$Res> {
  __$$_ChapterBatchCopyWithImpl(
      _$_ChapterBatch _value, $Res Function(_$_ChapterBatch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapterIds = freezed,
    Object? change = freezed,
  }) {
    return _then(_$_ChapterBatch(
      chapterIds: freezed == chapterIds
          ? _value._chapterIds
          : chapterIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      change: freezed == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as ChapterChange?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChapterBatch implements _ChapterBatch {
  _$_ChapterBatch({final List<int>? chapterIds, this.change})
      : _chapterIds = chapterIds;

  factory _$_ChapterBatch.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterBatchFromJson(json);

  final List<int>? _chapterIds;
  @override
  List<int>? get chapterIds {
    final value = _chapterIds;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ChapterChange? change;

  @override
  String toString() {
    return 'ChapterBatch(chapterIds: $chapterIds, change: $change)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChapterBatch &&
            const DeepCollectionEquality()
                .equals(other._chapterIds, _chapterIds) &&
            (identical(other.change, change) || other.change == change));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_chapterIds), change);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChapterBatchCopyWith<_$_ChapterBatch> get copyWith =>
      __$$_ChapterBatchCopyWithImpl<_$_ChapterBatch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterBatchToJson(
      this,
    );
  }
}

abstract class _ChapterBatch implements ChapterBatch {
  factory _ChapterBatch(
      {final List<int>? chapterIds,
      final ChapterChange? change}) = _$_ChapterBatch;

  factory _ChapterBatch.fromJson(Map<String, dynamic> json) =
      _$_ChapterBatch.fromJson;

  @override
  List<int>? get chapterIds;
  @override
  ChapterChange? get change;
  @override
  @JsonKey(ignore: true)
  _$$_ChapterBatchCopyWith<_$_ChapterBatch> get copyWith =>
      throw _privateConstructorUsedError;
}

ChapterChange _$ChapterChangeFromJson(Map<String, dynamic> json) {
  return _ChapterChange.fromJson(json);
}

/// @nodoc
mixin _$ChapterChange {
  bool? get isRead => throw _privateConstructorUsedError;
  bool? get isBookmarked => throw _privateConstructorUsedError;
  int? get lastPageRead => throw _privateConstructorUsedError;
  bool? get delete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterChangeCopyWith<ChapterChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterChangeCopyWith<$Res> {
  factory $ChapterChangeCopyWith(
          ChapterChange value, $Res Function(ChapterChange) then) =
      _$ChapterChangeCopyWithImpl<$Res, ChapterChange>;
  @useResult
  $Res call(
      {bool? isRead, bool? isBookmarked, int? lastPageRead, bool? delete});
}

/// @nodoc
class _$ChapterChangeCopyWithImpl<$Res, $Val extends ChapterChange>
    implements $ChapterChangeCopyWith<$Res> {
  _$ChapterChangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRead = freezed,
    Object? isBookmarked = freezed,
    Object? lastPageRead = freezed,
    Object? delete = freezed,
  }) {
    return _then(_value.copyWith(
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastPageRead: freezed == lastPageRead
          ? _value.lastPageRead
          : lastPageRead // ignore: cast_nullable_to_non_nullable
              as int?,
      delete: freezed == delete
          ? _value.delete
          : delete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChapterChangeCopyWith<$Res>
    implements $ChapterChangeCopyWith<$Res> {
  factory _$$_ChapterChangeCopyWith(
          _$_ChapterChange value, $Res Function(_$_ChapterChange) then) =
      __$$_ChapterChangeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isRead, bool? isBookmarked, int? lastPageRead, bool? delete});
}

/// @nodoc
class __$$_ChapterChangeCopyWithImpl<$Res>
    extends _$ChapterChangeCopyWithImpl<$Res, _$_ChapterChange>
    implements _$$_ChapterChangeCopyWith<$Res> {
  __$$_ChapterChangeCopyWithImpl(
      _$_ChapterChange _value, $Res Function(_$_ChapterChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRead = freezed,
    Object? isBookmarked = freezed,
    Object? lastPageRead = freezed,
    Object? delete = freezed,
  }) {
    return _then(_$_ChapterChange(
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastPageRead: freezed == lastPageRead
          ? _value.lastPageRead
          : lastPageRead // ignore: cast_nullable_to_non_nullable
              as int?,
      delete: freezed == delete
          ? _value.delete
          : delete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChapterChange implements _ChapterChange {
  _$_ChapterChange(
      {this.isRead, this.isBookmarked, this.lastPageRead, this.delete});

  factory _$_ChapterChange.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterChangeFromJson(json);

  @override
  final bool? isRead;
  @override
  final bool? isBookmarked;
  @override
  final int? lastPageRead;
  @override
  final bool? delete;

  @override
  String toString() {
    return 'ChapterChange(isRead: $isRead, isBookmarked: $isBookmarked, lastPageRead: $lastPageRead, delete: $delete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChapterChange &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.lastPageRead, lastPageRead) ||
                other.lastPageRead == lastPageRead) &&
            (identical(other.delete, delete) || other.delete == delete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isRead, isBookmarked, lastPageRead, delete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChapterChangeCopyWith<_$_ChapterChange> get copyWith =>
      __$$_ChapterChangeCopyWithImpl<_$_ChapterChange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterChangeToJson(
      this,
    );
  }
}

abstract class _ChapterChange implements ChapterChange {
  factory _ChapterChange(
      {final bool? isRead,
      final bool? isBookmarked,
      final int? lastPageRead,
      final bool? delete}) = _$_ChapterChange;

  factory _ChapterChange.fromJson(Map<String, dynamic> json) =
      _$_ChapterChange.fromJson;

  @override
  bool? get isRead;
  @override
  bool? get isBookmarked;
  @override
  int? get lastPageRead;
  @override
  bool? get delete;
  @override
  @JsonKey(ignore: true)
  _$$_ChapterChangeCopyWith<_$_ChapterChange> get copyWith =>
      throw _privateConstructorUsedError;
}
