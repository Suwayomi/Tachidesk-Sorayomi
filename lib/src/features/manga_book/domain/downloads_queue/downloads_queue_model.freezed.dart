// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloads_queue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DownloadsQueue _$DownloadsQueueFromJson(Map<String, dynamic> json) {
  return _DownloadsQueue.fromJson(json);
}

/// @nodoc
mixin _$DownloadsQueue {
  Chapter? get chapter => throw _privateConstructorUsedError;
  int? get chapterIndex => throw _privateConstructorUsedError;
  Manga? get manga => throw _privateConstructorUsedError;
  int? get mangaId => throw _privateConstructorUsedError;
  double? get progress => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  int? get tries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DownloadsQueueCopyWith<DownloadsQueue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadsQueueCopyWith<$Res> {
  factory $DownloadsQueueCopyWith(
          DownloadsQueue value, $Res Function(DownloadsQueue) then) =
      _$DownloadsQueueCopyWithImpl<$Res, DownloadsQueue>;
  @useResult
  $Res call(
      {Chapter? chapter,
      int? chapterIndex,
      Manga? manga,
      int? mangaId,
      double? progress,
      String? state,
      int? tries});

  $ChapterCopyWith<$Res>? get chapter;
  $MangaCopyWith<$Res>? get manga;
}

/// @nodoc
class _$DownloadsQueueCopyWithImpl<$Res, $Val extends DownloadsQueue>
    implements $DownloadsQueueCopyWith<$Res> {
  _$DownloadsQueueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapter = freezed,
    Object? chapterIndex = freezed,
    Object? manga = freezed,
    Object? mangaId = freezed,
    Object? progress = freezed,
    Object? state = freezed,
    Object? tries = freezed,
  }) {
    return _then(_value.copyWith(
      chapter: freezed == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter?,
      chapterIndex: freezed == chapterIndex
          ? _value.chapterIndex
          : chapterIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      manga: freezed == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga?,
      mangaId: freezed == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as int?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      tries: freezed == tries
          ? _value.tries
          : tries // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChapterCopyWith<$Res>? get chapter {
    if (_value.chapter == null) {
      return null;
    }

    return $ChapterCopyWith<$Res>(_value.chapter!, (value) {
      return _then(_value.copyWith(chapter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MangaCopyWith<$Res>? get manga {
    if (_value.manga == null) {
      return null;
    }

    return $MangaCopyWith<$Res>(_value.manga!, (value) {
      return _then(_value.copyWith(manga: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DownloadsQueueImplCopyWith<$Res>
    implements $DownloadsQueueCopyWith<$Res> {
  factory _$$DownloadsQueueImplCopyWith(_$DownloadsQueueImpl value,
          $Res Function(_$DownloadsQueueImpl) then) =
      __$$DownloadsQueueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Chapter? chapter,
      int? chapterIndex,
      Manga? manga,
      int? mangaId,
      double? progress,
      String? state,
      int? tries});

  @override
  $ChapterCopyWith<$Res>? get chapter;
  @override
  $MangaCopyWith<$Res>? get manga;
}

/// @nodoc
class __$$DownloadsQueueImplCopyWithImpl<$Res>
    extends _$DownloadsQueueCopyWithImpl<$Res, _$DownloadsQueueImpl>
    implements _$$DownloadsQueueImplCopyWith<$Res> {
  __$$DownloadsQueueImplCopyWithImpl(
      _$DownloadsQueueImpl _value, $Res Function(_$DownloadsQueueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapter = freezed,
    Object? chapterIndex = freezed,
    Object? manga = freezed,
    Object? mangaId = freezed,
    Object? progress = freezed,
    Object? state = freezed,
    Object? tries = freezed,
  }) {
    return _then(_$DownloadsQueueImpl(
      chapter: freezed == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter?,
      chapterIndex: freezed == chapterIndex
          ? _value.chapterIndex
          : chapterIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      manga: freezed == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga?,
      mangaId: freezed == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as int?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      tries: freezed == tries
          ? _value.tries
          : tries // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadsQueueImpl implements _DownloadsQueue {
  _$DownloadsQueueImpl(
      {this.chapter,
      this.chapterIndex,
      this.manga,
      this.mangaId,
      this.progress,
      this.state,
      this.tries});

  factory _$DownloadsQueueImpl.fromJson(Map<String, dynamic> json) =>
      _$$DownloadsQueueImplFromJson(json);

  @override
  final Chapter? chapter;
  @override
  final int? chapterIndex;
  @override
  final Manga? manga;
  @override
  final int? mangaId;
  @override
  final double? progress;
  @override
  final String? state;
  @override
  final int? tries;

  @override
  String toString() {
    return 'DownloadsQueue(chapter: $chapter, chapterIndex: $chapterIndex, manga: $manga, mangaId: $mangaId, progress: $progress, state: $state, tries: $tries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadsQueueImpl &&
            (identical(other.chapter, chapter) || other.chapter == chapter) &&
            (identical(other.chapterIndex, chapterIndex) ||
                other.chapterIndex == chapterIndex) &&
            (identical(other.manga, manga) || other.manga == manga) &&
            (identical(other.mangaId, mangaId) || other.mangaId == mangaId) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.tries, tries) || other.tries == tries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chapter, chapterIndex, manga,
      mangaId, progress, state, tries);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadsQueueImplCopyWith<_$DownloadsQueueImpl> get copyWith =>
      __$$DownloadsQueueImplCopyWithImpl<_$DownloadsQueueImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadsQueueImplToJson(
      this,
    );
  }
}

abstract class _DownloadsQueue implements DownloadsQueue {
  factory _DownloadsQueue(
      {final Chapter? chapter,
      final int? chapterIndex,
      final Manga? manga,
      final int? mangaId,
      final double? progress,
      final String? state,
      final int? tries}) = _$DownloadsQueueImpl;

  factory _DownloadsQueue.fromJson(Map<String, dynamic> json) =
      _$DownloadsQueueImpl.fromJson;

  @override
  Chapter? get chapter;
  @override
  int? get chapterIndex;
  @override
  Manga? get manga;
  @override
  int? get mangaId;
  @override
  double? get progress;
  @override
  String? get state;
  @override
  int? get tries;
  @override
  @JsonKey(ignore: true)
  _$$DownloadsQueueImplCopyWith<_$DownloadsQueueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
