// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_put_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChapterPut _$ChapterPutFromJson(Map<String, dynamic> json) {
  return _ChapterPut.fromJson(json);
}

/// @nodoc
mixin _$ChapterPut {
  bool? get read => throw _privateConstructorUsedError;
  bool? get bookmarked => throw _privateConstructorUsedError;
  bool? get markPrevRead => throw _privateConstructorUsedError;
  int? get lastPageRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterPutCopyWith<ChapterPut> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterPutCopyWith<$Res> {
  factory $ChapterPutCopyWith(
          ChapterPut value, $Res Function(ChapterPut) then) =
      _$ChapterPutCopyWithImpl<$Res, ChapterPut>;
  @useResult
  $Res call(
      {bool? read, bool? bookmarked, bool? markPrevRead, int? lastPageRead});
}

/// @nodoc
class _$ChapterPutCopyWithImpl<$Res, $Val extends ChapterPut>
    implements $ChapterPutCopyWith<$Res> {
  _$ChapterPutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? read = freezed,
    Object? bookmarked = freezed,
    Object? markPrevRead = freezed,
    Object? lastPageRead = freezed,
  }) {
    return _then(_value.copyWith(
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      bookmarked: freezed == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      markPrevRead: freezed == markPrevRead
          ? _value.markPrevRead
          : markPrevRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastPageRead: freezed == lastPageRead
          ? _value.lastPageRead
          : lastPageRead // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChapterPutCopyWith<$Res>
    implements $ChapterPutCopyWith<$Res> {
  factory _$$_ChapterPutCopyWith(
          _$_ChapterPut value, $Res Function(_$_ChapterPut) then) =
      __$$_ChapterPutCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? read, bool? bookmarked, bool? markPrevRead, int? lastPageRead});
}

/// @nodoc
class __$$_ChapterPutCopyWithImpl<$Res>
    extends _$ChapterPutCopyWithImpl<$Res, _$_ChapterPut>
    implements _$$_ChapterPutCopyWith<$Res> {
  __$$_ChapterPutCopyWithImpl(
      _$_ChapterPut _value, $Res Function(_$_ChapterPut) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? read = freezed,
    Object? bookmarked = freezed,
    Object? markPrevRead = freezed,
    Object? lastPageRead = freezed,
  }) {
    return _then(_$_ChapterPut(
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      bookmarked: freezed == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      markPrevRead: freezed == markPrevRead
          ? _value.markPrevRead
          : markPrevRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastPageRead: freezed == lastPageRead
          ? _value.lastPageRead
          : lastPageRead // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChapterPut implements _ChapterPut {
  _$_ChapterPut(
      {this.read, this.bookmarked, this.markPrevRead, this.lastPageRead});

  factory _$_ChapterPut.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterPutFromJson(json);

  @override
  final bool? read;
  @override
  final bool? bookmarked;
  @override
  final bool? markPrevRead;
  @override
  final int? lastPageRead;

  @override
  String toString() {
    return 'ChapterPut(read: $read, bookmarked: $bookmarked, markPrevRead: $markPrevRead, lastPageRead: $lastPageRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChapterPut &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked) &&
            (identical(other.markPrevRead, markPrevRead) ||
                other.markPrevRead == markPrevRead) &&
            (identical(other.lastPageRead, lastPageRead) ||
                other.lastPageRead == lastPageRead));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, read, bookmarked, markPrevRead, lastPageRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChapterPutCopyWith<_$_ChapterPut> get copyWith =>
      __$$_ChapterPutCopyWithImpl<_$_ChapterPut>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterPutToJson(
      this,
    );
  }
}

abstract class _ChapterPut implements ChapterPut {
  factory _ChapterPut(
      {final bool? read,
      final bool? bookmarked,
      final bool? markPrevRead,
      final int? lastPageRead}) = _$_ChapterPut;

  factory _ChapterPut.fromJson(Map<String, dynamic> json) =
      _$_ChapterPut.fromJson;

  @override
  bool? get read;
  @override
  bool? get bookmarked;
  @override
  bool? get markPrevRead;
  @override
  int? get lastPageRead;
  @override
  @JsonKey(ignore: true)
  _$$_ChapterPutCopyWith<_$_ChapterPut> get copyWith =>
      throw _privateConstructorUsedError;
}
