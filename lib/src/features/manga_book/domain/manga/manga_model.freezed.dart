// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Manga _$MangaFromJson(Map<String, dynamic> json) {
  return _Manga.fromJson(json);
}

/// @nodoc
mixin _$Manga {
  String? get artist => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get downloadCount => throw _privateConstructorUsedError;
  int? get chapterCount => throw _privateConstructorUsedError;
  int? get lastReadAt => throw _privateConstructorUsedError;
  Chapter? get lastChapterRead => throw _privateConstructorUsedError;
  bool? get freshData => throw _privateConstructorUsedError;
  List<String>? get genre => throw _privateConstructorUsedError;
  bool? get inLibrary => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get inLibraryAt => throw _privateConstructorUsedError;
  bool? get initialized => throw _privateConstructorUsedError;
  String? get realUrl => throw _privateConstructorUsedError;
  Source? get source => throw _privateConstructorUsedError;
  String? get sourceId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: MangaStatus.fromJson, toJson: MangaStatus.toJson)
  MangaStatus? get status => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  int? get thumbnailUrlLastFetched => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get unreadCount => throw _privateConstructorUsedError;
  int? get lastFetchedAt => throw _privateConstructorUsedError;
  int? get chaptersLastFetchedAt => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  MangaMeta? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MangaCopyWith<Manga> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaCopyWith<$Res> {
  factory $MangaCopyWith(Manga value, $Res Function(Manga) then) =
      _$MangaCopyWithImpl<$Res, Manga>;
  @useResult
  $Res call(
      {String? artist,
      String? author,
      String? description,
      int? downloadCount,
      int? chapterCount,
      int? lastReadAt,
      Chapter? lastChapterRead,
      bool? freshData,
      List<String>? genre,
      bool? inLibrary,
      int? id,
      int? inLibraryAt,
      bool? initialized,
      String? realUrl,
      Source? source,
      String? sourceId,
      @JsonKey(fromJson: MangaStatus.fromJson, toJson: MangaStatus.toJson)
      MangaStatus? status,
      String? thumbnailUrl,
      int? thumbnailUrlLastFetched,
      String? title,
      int? unreadCount,
      int? lastFetchedAt,
      int? chaptersLastFetchedAt,
      String? url,
      MangaMeta? meta});

  $ChapterCopyWith<$Res>? get lastChapterRead;
  $SourceCopyWith<$Res>? get source;
  $MangaMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$MangaCopyWithImpl<$Res, $Val extends Manga>
    implements $MangaCopyWith<$Res> {
  _$MangaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist = freezed,
    Object? author = freezed,
    Object? description = freezed,
    Object? downloadCount = freezed,
    Object? chapterCount = freezed,
    Object? lastReadAt = freezed,
    Object? lastChapterRead = freezed,
    Object? freshData = freezed,
    Object? genre = freezed,
    Object? inLibrary = freezed,
    Object? id = freezed,
    Object? inLibraryAt = freezed,
    Object? initialized = freezed,
    Object? realUrl = freezed,
    Object? source = freezed,
    Object? sourceId = freezed,
    Object? status = freezed,
    Object? thumbnailUrl = freezed,
    Object? thumbnailUrlLastFetched = freezed,
    Object? title = freezed,
    Object? unreadCount = freezed,
    Object? lastFetchedAt = freezed,
    Object? chaptersLastFetchedAt = freezed,
    Object? url = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadCount: freezed == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      chapterCount: freezed == chapterCount
          ? _value.chapterCount
          : chapterCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastReadAt: freezed == lastReadAt
          ? _value.lastReadAt
          : lastReadAt // ignore: cast_nullable_to_non_nullable
              as int?,
      lastChapterRead: freezed == lastChapterRead
          ? _value.lastChapterRead
          : lastChapterRead // ignore: cast_nullable_to_non_nullable
              as Chapter?,
      freshData: freezed == freshData
          ? _value.freshData
          : freshData // ignore: cast_nullable_to_non_nullable
              as bool?,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      inLibrary: freezed == inLibrary
          ? _value.inLibrary
          : inLibrary // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      inLibraryAt: freezed == inLibraryAt
          ? _value.inLibraryAt
          : inLibraryAt // ignore: cast_nullable_to_non_nullable
              as int?,
      initialized: freezed == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool?,
      realUrl: freezed == realUrl
          ? _value.realUrl
          : realUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MangaStatus?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrlLastFetched: freezed == thumbnailUrlLastFetched
          ? _value.thumbnailUrlLastFetched
          : thumbnailUrlLastFetched // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadCount: freezed == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastFetchedAt: freezed == lastFetchedAt
          ? _value.lastFetchedAt
          : lastFetchedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      chaptersLastFetchedAt: freezed == chaptersLastFetchedAt
          ? _value.chaptersLastFetchedAt
          : chaptersLastFetchedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MangaMeta?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChapterCopyWith<$Res>? get lastChapterRead {
    if (_value.lastChapterRead == null) {
      return null;
    }

    return $ChapterCopyWith<$Res>(_value.lastChapterRead!, (value) {
      return _then(_value.copyWith(lastChapterRead: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SourceCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MangaMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MangaMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MangaCopyWith<$Res> implements $MangaCopyWith<$Res> {
  factory _$$_MangaCopyWith(_$_Manga value, $Res Function(_$_Manga) then) =
      __$$_MangaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? artist,
      String? author,
      String? description,
      int? downloadCount,
      int? chapterCount,
      int? lastReadAt,
      Chapter? lastChapterRead,
      bool? freshData,
      List<String>? genre,
      bool? inLibrary,
      int? id,
      int? inLibraryAt,
      bool? initialized,
      String? realUrl,
      Source? source,
      String? sourceId,
      @JsonKey(fromJson: MangaStatus.fromJson, toJson: MangaStatus.toJson)
      MangaStatus? status,
      String? thumbnailUrl,
      int? thumbnailUrlLastFetched,
      String? title,
      int? unreadCount,
      int? lastFetchedAt,
      int? chaptersLastFetchedAt,
      String? url,
      MangaMeta? meta});

  @override
  $ChapterCopyWith<$Res>? get lastChapterRead;
  @override
  $SourceCopyWith<$Res>? get source;
  @override
  $MangaMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$_MangaCopyWithImpl<$Res> extends _$MangaCopyWithImpl<$Res, _$_Manga>
    implements _$$_MangaCopyWith<$Res> {
  __$$_MangaCopyWithImpl(_$_Manga _value, $Res Function(_$_Manga) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist = freezed,
    Object? author = freezed,
    Object? description = freezed,
    Object? downloadCount = freezed,
    Object? chapterCount = freezed,
    Object? lastReadAt = freezed,
    Object? lastChapterRead = freezed,
    Object? freshData = freezed,
    Object? genre = freezed,
    Object? inLibrary = freezed,
    Object? id = freezed,
    Object? inLibraryAt = freezed,
    Object? initialized = freezed,
    Object? realUrl = freezed,
    Object? source = freezed,
    Object? sourceId = freezed,
    Object? status = freezed,
    Object? thumbnailUrl = freezed,
    Object? thumbnailUrlLastFetched = freezed,
    Object? title = freezed,
    Object? unreadCount = freezed,
    Object? lastFetchedAt = freezed,
    Object? chaptersLastFetchedAt = freezed,
    Object? url = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$_Manga(
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadCount: freezed == downloadCount
          ? _value.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      chapterCount: freezed == chapterCount
          ? _value.chapterCount
          : chapterCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastReadAt: freezed == lastReadAt
          ? _value.lastReadAt
          : lastReadAt // ignore: cast_nullable_to_non_nullable
              as int?,
      lastChapterRead: freezed == lastChapterRead
          ? _value.lastChapterRead
          : lastChapterRead // ignore: cast_nullable_to_non_nullable
              as Chapter?,
      freshData: freezed == freshData
          ? _value.freshData
          : freshData // ignore: cast_nullable_to_non_nullable
              as bool?,
      genre: freezed == genre
          ? _value._genre
          : genre // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      inLibrary: freezed == inLibrary
          ? _value.inLibrary
          : inLibrary // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      inLibraryAt: freezed == inLibraryAt
          ? _value.inLibraryAt
          : inLibraryAt // ignore: cast_nullable_to_non_nullable
              as int?,
      initialized: freezed == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool?,
      realUrl: freezed == realUrl
          ? _value.realUrl
          : realUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MangaStatus?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrlLastFetched: freezed == thumbnailUrlLastFetched
          ? _value.thumbnailUrlLastFetched
          : thumbnailUrlLastFetched // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadCount: freezed == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastFetchedAt: freezed == lastFetchedAt
          ? _value.lastFetchedAt
          : lastFetchedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      chaptersLastFetchedAt: freezed == chaptersLastFetchedAt
          ? _value.chaptersLastFetchedAt
          : chaptersLastFetchedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MangaMeta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Manga extends _Manga {
  _$_Manga(
      {this.artist,
      this.author,
      this.description,
      this.downloadCount,
      this.chapterCount,
      this.lastReadAt,
      this.lastChapterRead,
      this.freshData,
      final List<String>? genre,
      this.inLibrary,
      this.id,
      this.inLibraryAt,
      this.initialized,
      this.realUrl,
      this.source,
      this.sourceId,
      @JsonKey(fromJson: MangaStatus.fromJson, toJson: MangaStatus.toJson)
      this.status,
      this.thumbnailUrl,
      this.thumbnailUrlLastFetched,
      this.title,
      this.unreadCount,
      this.lastFetchedAt,
      this.chaptersLastFetchedAt,
      this.url,
      this.meta})
      : _genre = genre,
        super._();

  factory _$_Manga.fromJson(Map<String, dynamic> json) =>
      _$$_MangaFromJson(json);

  @override
  final String? artist;
  @override
  final String? author;
  @override
  final String? description;
  @override
  final int? downloadCount;
  @override
  final int? chapterCount;
  @override
  final int? lastReadAt;
  @override
  final Chapter? lastChapterRead;
  @override
  final bool? freshData;
  final List<String>? _genre;
  @override
  List<String>? get genre {
    final value = _genre;
    if (value == null) return null;
    if (_genre is EqualUnmodifiableListView) return _genre;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? inLibrary;
  @override
  final int? id;
  @override
  final int? inLibraryAt;
  @override
  final bool? initialized;
  @override
  final String? realUrl;
  @override
  final Source? source;
  @override
  final String? sourceId;
  @override
  @JsonKey(fromJson: MangaStatus.fromJson, toJson: MangaStatus.toJson)
  final MangaStatus? status;
  @override
  final String? thumbnailUrl;
  @override
  final int? thumbnailUrlLastFetched;
  @override
  final String? title;
  @override
  final int? unreadCount;
  @override
  final int? lastFetchedAt;
  @override
  final int? chaptersLastFetchedAt;
  @override
  final String? url;
  @override
  final MangaMeta? meta;

  @override
  String toString() {
    return 'Manga(artist: $artist, author: $author, description: $description, downloadCount: $downloadCount, chapterCount: $chapterCount, lastReadAt: $lastReadAt, lastChapterRead: $lastChapterRead, freshData: $freshData, genre: $genre, inLibrary: $inLibrary, id: $id, inLibraryAt: $inLibraryAt, initialized: $initialized, realUrl: $realUrl, source: $source, sourceId: $sourceId, status: $status, thumbnailUrl: $thumbnailUrl, thumbnailUrlLastFetched: $thumbnailUrlLastFetched, title: $title, unreadCount: $unreadCount, lastFetchedAt: $lastFetchedAt, chaptersLastFetchedAt: $chaptersLastFetchedAt, url: $url, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Manga &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            (identical(other.chapterCount, chapterCount) ||
                other.chapterCount == chapterCount) &&
            (identical(other.lastReadAt, lastReadAt) ||
                other.lastReadAt == lastReadAt) &&
            (identical(other.lastChapterRead, lastChapterRead) ||
                other.lastChapterRead == lastChapterRead) &&
            (identical(other.freshData, freshData) ||
                other.freshData == freshData) &&
            const DeepCollectionEquality().equals(other._genre, _genre) &&
            (identical(other.inLibrary, inLibrary) ||
                other.inLibrary == inLibrary) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inLibraryAt, inLibraryAt) ||
                other.inLibraryAt == inLibraryAt) &&
            (identical(other.initialized, initialized) ||
                other.initialized == initialized) &&
            (identical(other.realUrl, realUrl) || other.realUrl == realUrl) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(
                    other.thumbnailUrlLastFetched, thumbnailUrlLastFetched) ||
                other.thumbnailUrlLastFetched == thumbnailUrlLastFetched) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.lastFetchedAt, lastFetchedAt) ||
                other.lastFetchedAt == lastFetchedAt) &&
            (identical(other.chaptersLastFetchedAt, chaptersLastFetchedAt) ||
                other.chaptersLastFetchedAt == chaptersLastFetchedAt) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        artist,
        author,
        description,
        downloadCount,
        chapterCount,
        lastReadAt,
        lastChapterRead,
        freshData,
        const DeepCollectionEquality().hash(_genre),
        inLibrary,
        id,
        inLibraryAt,
        initialized,
        realUrl,
        source,
        sourceId,
        status,
        thumbnailUrl,
        thumbnailUrlLastFetched,
        title,
        unreadCount,
        lastFetchedAt,
        chaptersLastFetchedAt,
        url,
        meta
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MangaCopyWith<_$_Manga> get copyWith =>
      __$$_MangaCopyWithImpl<_$_Manga>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MangaToJson(
      this,
    );
  }
}

abstract class _Manga extends Manga {
  factory _Manga(
      {final String? artist,
      final String? author,
      final String? description,
      final int? downloadCount,
      final int? chapterCount,
      final int? lastReadAt,
      final Chapter? lastChapterRead,
      final bool? freshData,
      final List<String>? genre,
      final bool? inLibrary,
      final int? id,
      final int? inLibraryAt,
      final bool? initialized,
      final String? realUrl,
      final Source? source,
      final String? sourceId,
      @JsonKey(fromJson: MangaStatus.fromJson, toJson: MangaStatus.toJson)
      final MangaStatus? status,
      final String? thumbnailUrl,
      final int? thumbnailUrlLastFetched,
      final String? title,
      final int? unreadCount,
      final int? lastFetchedAt,
      final int? chaptersLastFetchedAt,
      final String? url,
      final MangaMeta? meta}) = _$_Manga;
  _Manga._() : super._();

  factory _Manga.fromJson(Map<String, dynamic> json) = _$_Manga.fromJson;

  @override
  String? get artist;
  @override
  String? get author;
  @override
  String? get description;
  @override
  int? get downloadCount;
  @override
  int? get chapterCount;
  @override
  int? get lastReadAt;
  @override
  Chapter? get lastChapterRead;
  @override
  bool? get freshData;
  @override
  List<String>? get genre;
  @override
  bool? get inLibrary;
  @override
  int? get id;
  @override
  int? get inLibraryAt;
  @override
  bool? get initialized;
  @override
  String? get realUrl;
  @override
  Source? get source;
  @override
  String? get sourceId;
  @override
  @JsonKey(fromJson: MangaStatus.fromJson, toJson: MangaStatus.toJson)
  MangaStatus? get status;
  @override
  String? get thumbnailUrl;
  @override
  int? get thumbnailUrlLastFetched;
  @override
  String? get title;
  @override
  int? get unreadCount;
  @override
  int? get lastFetchedAt;
  @override
  int? get chaptersLastFetchedAt;
  @override
  String? get url;
  @override
  MangaMeta? get meta;
  @override
  @JsonKey(ignore: true)
  _$$_MangaCopyWith<_$_Manga> get copyWith =>
      throw _privateConstructorUsedError;
}

MangaMeta _$MangaMetaFromJson(Map<String, dynamic> json) {
  return _MangaMeta.fromJson(json);
}

/// @nodoc
mixin _$MangaMeta {
  @JsonKey(
      name: "flutter_readerNavigationLayoutInvert",
      fromJson: MangaMeta.fromJsonToBool)
  bool? get invertTap => throw _privateConstructorUsedError;
  @JsonKey(name: "flutter_readerNavigationLayout")
  ReaderNavigationLayout? get readerNavigationLayout =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "flutter_readerMode")
  ReaderMode? get readerMode => throw _privateConstructorUsedError;
  @JsonKey(name: "flutter_readerPadding", fromJson: MangaMeta.fromJsonToDouble)
  double? get readerPadding => throw _privateConstructorUsedError;
  @JsonKey(
      name: "flutter_readerMagnifierSize", fromJson: MangaMeta.fromJsonToDouble)
  double? get readerMagnifierSize => throw _privateConstructorUsedError;
  @JsonKey(name: "flutter_scanlator")
  String? get scanlator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MangaMetaCopyWith<MangaMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MangaMetaCopyWith<$Res> {
  factory $MangaMetaCopyWith(MangaMeta value, $Res Function(MangaMeta) then) =
      _$MangaMetaCopyWithImpl<$Res, MangaMeta>;
  @useResult
  $Res call(
      {@JsonKey(
          name: "flutter_readerNavigationLayoutInvert",
          fromJson: MangaMeta.fromJsonToBool)
      bool? invertTap,
      @JsonKey(name: "flutter_readerNavigationLayout")
      ReaderNavigationLayout? readerNavigationLayout,
      @JsonKey(name: "flutter_readerMode") ReaderMode? readerMode,
      @JsonKey(
          name: "flutter_readerPadding", fromJson: MangaMeta.fromJsonToDouble)
      double? readerPadding,
      @JsonKey(
          name: "flutter_readerMagnifierSize",
          fromJson: MangaMeta.fromJsonToDouble)
      double? readerMagnifierSize,
      @JsonKey(name: "flutter_scanlator") String? scanlator});
}

/// @nodoc
class _$MangaMetaCopyWithImpl<$Res, $Val extends MangaMeta>
    implements $MangaMetaCopyWith<$Res> {
  _$MangaMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invertTap = freezed,
    Object? readerNavigationLayout = freezed,
    Object? readerMode = freezed,
    Object? readerPadding = freezed,
    Object? readerMagnifierSize = freezed,
    Object? scanlator = freezed,
  }) {
    return _then(_value.copyWith(
      invertTap: freezed == invertTap
          ? _value.invertTap
          : invertTap // ignore: cast_nullable_to_non_nullable
              as bool?,
      readerNavigationLayout: freezed == readerNavigationLayout
          ? _value.readerNavigationLayout
          : readerNavigationLayout // ignore: cast_nullable_to_non_nullable
              as ReaderNavigationLayout?,
      readerMode: freezed == readerMode
          ? _value.readerMode
          : readerMode // ignore: cast_nullable_to_non_nullable
              as ReaderMode?,
      readerPadding: freezed == readerPadding
          ? _value.readerPadding
          : readerPadding // ignore: cast_nullable_to_non_nullable
              as double?,
      readerMagnifierSize: freezed == readerMagnifierSize
          ? _value.readerMagnifierSize
          : readerMagnifierSize // ignore: cast_nullable_to_non_nullable
              as double?,
      scanlator: freezed == scanlator
          ? _value.scanlator
          : scanlator // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MangaMetaCopyWith<$Res> implements $MangaMetaCopyWith<$Res> {
  factory _$$_MangaMetaCopyWith(
          _$_MangaMeta value, $Res Function(_$_MangaMeta) then) =
      __$$_MangaMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: "flutter_readerNavigationLayoutInvert",
          fromJson: MangaMeta.fromJsonToBool)
      bool? invertTap,
      @JsonKey(name: "flutter_readerNavigationLayout")
      ReaderNavigationLayout? readerNavigationLayout,
      @JsonKey(name: "flutter_readerMode") ReaderMode? readerMode,
      @JsonKey(
          name: "flutter_readerPadding", fromJson: MangaMeta.fromJsonToDouble)
      double? readerPadding,
      @JsonKey(
          name: "flutter_readerMagnifierSize",
          fromJson: MangaMeta.fromJsonToDouble)
      double? readerMagnifierSize,
      @JsonKey(name: "flutter_scanlator") String? scanlator});
}

/// @nodoc
class __$$_MangaMetaCopyWithImpl<$Res>
    extends _$MangaMetaCopyWithImpl<$Res, _$_MangaMeta>
    implements _$$_MangaMetaCopyWith<$Res> {
  __$$_MangaMetaCopyWithImpl(
      _$_MangaMeta _value, $Res Function(_$_MangaMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invertTap = freezed,
    Object? readerNavigationLayout = freezed,
    Object? readerMode = freezed,
    Object? readerPadding = freezed,
    Object? readerMagnifierSize = freezed,
    Object? scanlator = freezed,
  }) {
    return _then(_$_MangaMeta(
      invertTap: freezed == invertTap
          ? _value.invertTap
          : invertTap // ignore: cast_nullable_to_non_nullable
              as bool?,
      readerNavigationLayout: freezed == readerNavigationLayout
          ? _value.readerNavigationLayout
          : readerNavigationLayout // ignore: cast_nullable_to_non_nullable
              as ReaderNavigationLayout?,
      readerMode: freezed == readerMode
          ? _value.readerMode
          : readerMode // ignore: cast_nullable_to_non_nullable
              as ReaderMode?,
      readerPadding: freezed == readerPadding
          ? _value.readerPadding
          : readerPadding // ignore: cast_nullable_to_non_nullable
              as double?,
      readerMagnifierSize: freezed == readerMagnifierSize
          ? _value.readerMagnifierSize
          : readerMagnifierSize // ignore: cast_nullable_to_non_nullable
              as double?,
      scanlator: freezed == scanlator
          ? _value.scanlator
          : scanlator // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MangaMeta implements _MangaMeta {
  _$_MangaMeta(
      {@JsonKey(
          name: "flutter_readerNavigationLayoutInvert",
          fromJson: MangaMeta.fromJsonToBool)
      this.invertTap,
      @JsonKey(name: "flutter_readerNavigationLayout")
      this.readerNavigationLayout,
      @JsonKey(name: "flutter_readerMode") this.readerMode,
      @JsonKey(
          name: "flutter_readerPadding", fromJson: MangaMeta.fromJsonToDouble)
      this.readerPadding,
      @JsonKey(
          name: "flutter_readerMagnifierSize",
          fromJson: MangaMeta.fromJsonToDouble)
      this.readerMagnifierSize,
      @JsonKey(name: "flutter_scanlator") this.scanlator});

  factory _$_MangaMeta.fromJson(Map<String, dynamic> json) =>
      _$$_MangaMetaFromJson(json);

  @override
  @JsonKey(
      name: "flutter_readerNavigationLayoutInvert",
      fromJson: MangaMeta.fromJsonToBool)
  final bool? invertTap;
  @override
  @JsonKey(name: "flutter_readerNavigationLayout")
  final ReaderNavigationLayout? readerNavigationLayout;
  @override
  @JsonKey(name: "flutter_readerMode")
  final ReaderMode? readerMode;
  @override
  @JsonKey(name: "flutter_readerPadding", fromJson: MangaMeta.fromJsonToDouble)
  final double? readerPadding;
  @override
  @JsonKey(
      name: "flutter_readerMagnifierSize", fromJson: MangaMeta.fromJsonToDouble)
  final double? readerMagnifierSize;
  @override
  @JsonKey(name: "flutter_scanlator")
  final String? scanlator;

  @override
  String toString() {
    return 'MangaMeta(invertTap: $invertTap, readerNavigationLayout: $readerNavigationLayout, readerMode: $readerMode, readerPadding: $readerPadding, readerMagnifierSize: $readerMagnifierSize, scanlator: $scanlator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MangaMeta &&
            (identical(other.invertTap, invertTap) ||
                other.invertTap == invertTap) &&
            (identical(other.readerNavigationLayout, readerNavigationLayout) ||
                other.readerNavigationLayout == readerNavigationLayout) &&
            (identical(other.readerMode, readerMode) ||
                other.readerMode == readerMode) &&
            (identical(other.readerPadding, readerPadding) ||
                other.readerPadding == readerPadding) &&
            (identical(other.readerMagnifierSize, readerMagnifierSize) ||
                other.readerMagnifierSize == readerMagnifierSize) &&
            (identical(other.scanlator, scanlator) ||
                other.scanlator == scanlator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      invertTap,
      readerNavigationLayout,
      readerMode,
      readerPadding,
      readerMagnifierSize,
      scanlator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MangaMetaCopyWith<_$_MangaMeta> get copyWith =>
      __$$_MangaMetaCopyWithImpl<_$_MangaMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MangaMetaToJson(
      this,
    );
  }
}

abstract class _MangaMeta implements MangaMeta {
  factory _MangaMeta(
      {@JsonKey(
          name: "flutter_readerNavigationLayoutInvert",
          fromJson: MangaMeta.fromJsonToBool)
      final bool? invertTap,
      @JsonKey(name: "flutter_readerNavigationLayout")
      final ReaderNavigationLayout? readerNavigationLayout,
      @JsonKey(name: "flutter_readerMode") final ReaderMode? readerMode,
      @JsonKey(
          name: "flutter_readerPadding", fromJson: MangaMeta.fromJsonToDouble)
      final double? readerPadding,
      @JsonKey(
          name: "flutter_readerMagnifierSize",
          fromJson: MangaMeta.fromJsonToDouble)
      final double? readerMagnifierSize,
      @JsonKey(name: "flutter_scanlator")
      final String? scanlator}) = _$_MangaMeta;

  factory _MangaMeta.fromJson(Map<String, dynamic> json) =
      _$_MangaMeta.fromJson;

  @override
  @JsonKey(
      name: "flutter_readerNavigationLayoutInvert",
      fromJson: MangaMeta.fromJsonToBool)
  bool? get invertTap;
  @override
  @JsonKey(name: "flutter_readerNavigationLayout")
  ReaderNavigationLayout? get readerNavigationLayout;
  @override
  @JsonKey(name: "flutter_readerMode")
  ReaderMode? get readerMode;
  @override
  @JsonKey(name: "flutter_readerPadding", fromJson: MangaMeta.fromJsonToDouble)
  double? get readerPadding;
  @override
  @JsonKey(
      name: "flutter_readerMagnifierSize", fromJson: MangaMeta.fromJsonToDouble)
  double? get readerMagnifierSize;
  @override
  @JsonKey(name: "flutter_scanlator")
  String? get scanlator;
  @override
  @JsonKey(ignore: true)
  _$$_MangaMetaCopyWith<_$_MangaMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
