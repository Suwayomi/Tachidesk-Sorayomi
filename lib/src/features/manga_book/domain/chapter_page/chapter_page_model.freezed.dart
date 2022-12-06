// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChapterMangaPair _$ChapterMangaPairFromJson(Map<String, dynamic> json) {
  return _ChapterMangaPair.fromJson(json);
}

/// @nodoc
mixin _$ChapterMangaPair {
  Chapter? get chapter => throw _privateConstructorUsedError;
  Manga? get manga => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterMangaPairCopyWith<ChapterMangaPair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterMangaPairCopyWith<$Res> {
  factory $ChapterMangaPairCopyWith(
          ChapterMangaPair value, $Res Function(ChapterMangaPair) then) =
      _$ChapterMangaPairCopyWithImpl<$Res, ChapterMangaPair>;
  @useResult
  $Res call({Chapter? chapter, Manga? manga});

  $ChapterCopyWith<$Res>? get chapter;
  $MangaCopyWith<$Res>? get manga;
}

/// @nodoc
class _$ChapterMangaPairCopyWithImpl<$Res, $Val extends ChapterMangaPair>
    implements $ChapterMangaPairCopyWith<$Res> {
  _$ChapterMangaPairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapter = freezed,
    Object? manga = freezed,
  }) {
    return _then(_value.copyWith(
      chapter: freezed == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter?,
      manga: freezed == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga?,
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
abstract class _$$_ChapterMangaPairCopyWith<$Res>
    implements $ChapterMangaPairCopyWith<$Res> {
  factory _$$_ChapterMangaPairCopyWith(
          _$_ChapterMangaPair value, $Res Function(_$_ChapterMangaPair) then) =
      __$$_ChapterMangaPairCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Chapter? chapter, Manga? manga});

  @override
  $ChapterCopyWith<$Res>? get chapter;
  @override
  $MangaCopyWith<$Res>? get manga;
}

/// @nodoc
class __$$_ChapterMangaPairCopyWithImpl<$Res>
    extends _$ChapterMangaPairCopyWithImpl<$Res, _$_ChapterMangaPair>
    implements _$$_ChapterMangaPairCopyWith<$Res> {
  __$$_ChapterMangaPairCopyWithImpl(
      _$_ChapterMangaPair _value, $Res Function(_$_ChapterMangaPair) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapter = freezed,
    Object? manga = freezed,
  }) {
    return _then(_$_ChapterMangaPair(
      chapter: freezed == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter?,
      manga: freezed == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChapterMangaPair implements _ChapterMangaPair {
  _$_ChapterMangaPair({this.chapter, this.manga});

  factory _$_ChapterMangaPair.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterMangaPairFromJson(json);

  @override
  final Chapter? chapter;
  @override
  final Manga? manga;

  @override
  String toString() {
    return 'ChapterMangaPair(chapter: $chapter, manga: $manga)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChapterMangaPair &&
            (identical(other.chapter, chapter) || other.chapter == chapter) &&
            (identical(other.manga, manga) || other.manga == manga));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chapter, manga);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChapterMangaPairCopyWith<_$_ChapterMangaPair> get copyWith =>
      __$$_ChapterMangaPairCopyWithImpl<_$_ChapterMangaPair>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterMangaPairToJson(
      this,
    );
  }
}

abstract class _ChapterMangaPair implements ChapterMangaPair {
  factory _ChapterMangaPair({final Chapter? chapter, final Manga? manga}) =
      _$_ChapterMangaPair;

  factory _ChapterMangaPair.fromJson(Map<String, dynamic> json) =
      _$_ChapterMangaPair.fromJson;

  @override
  Chapter? get chapter;
  @override
  Manga? get manga;
  @override
  @JsonKey(ignore: true)
  _$$_ChapterMangaPairCopyWith<_$_ChapterMangaPair> get copyWith =>
      throw _privateConstructorUsedError;
}

ChapterPage _$ChapterPageFromJson(Map<String, dynamic> json) {
  return _ChapterPage.fromJson(json);
}

/// @nodoc
mixin _$ChapterPage {
  bool? get hasNextPage => throw _privateConstructorUsedError;
  List<ChapterMangaPair>? get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterPageCopyWith<ChapterPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterPageCopyWith<$Res> {
  factory $ChapterPageCopyWith(
          ChapterPage value, $Res Function(ChapterPage) then) =
      _$ChapterPageCopyWithImpl<$Res, ChapterPage>;
  @useResult
  $Res call({bool? hasNextPage, List<ChapterMangaPair>? page});
}

/// @nodoc
class _$ChapterPageCopyWithImpl<$Res, $Val extends ChapterPage>
    implements $ChapterPageCopyWith<$Res> {
  _$ChapterPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNextPage = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      hasNextPage: freezed == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as List<ChapterMangaPair>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChapterPageCopyWith<$Res>
    implements $ChapterPageCopyWith<$Res> {
  factory _$$_ChapterPageCopyWith(
          _$_ChapterPage value, $Res Function(_$_ChapterPage) then) =
      __$$_ChapterPageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? hasNextPage, List<ChapterMangaPair>? page});
}

/// @nodoc
class __$$_ChapterPageCopyWithImpl<$Res>
    extends _$ChapterPageCopyWithImpl<$Res, _$_ChapterPage>
    implements _$$_ChapterPageCopyWith<$Res> {
  __$$_ChapterPageCopyWithImpl(
      _$_ChapterPage _value, $Res Function(_$_ChapterPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNextPage = freezed,
    Object? page = freezed,
  }) {
    return _then(_$_ChapterPage(
      hasNextPage: freezed == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _value._page
          : page // ignore: cast_nullable_to_non_nullable
              as List<ChapterMangaPair>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChapterPage implements _ChapterPage {
  _$_ChapterPage({this.hasNextPage, final List<ChapterMangaPair>? page})
      : _page = page;

  factory _$_ChapterPage.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterPageFromJson(json);

  @override
  final bool? hasNextPage;
  final List<ChapterMangaPair>? _page;
  @override
  List<ChapterMangaPair>? get page {
    final value = _page;
    if (value == null) return null;
    if (_page is EqualUnmodifiableListView) return _page;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChapterPage(hasNextPage: $hasNextPage, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChapterPage &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            const DeepCollectionEquality().equals(other._page, _page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, hasNextPage, const DeepCollectionEquality().hash(_page));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChapterPageCopyWith<_$_ChapterPage> get copyWith =>
      __$$_ChapterPageCopyWithImpl<_$_ChapterPage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterPageToJson(
      this,
    );
  }
}

abstract class _ChapterPage implements ChapterPage {
  factory _ChapterPage(
      {final bool? hasNextPage,
      final List<ChapterMangaPair>? page}) = _$_ChapterPage;

  factory _ChapterPage.fromJson(Map<String, dynamic> json) =
      _$_ChapterPage.fromJson;

  @override
  bool? get hasNextPage;
  @override
  List<ChapterMangaPair>? get page;
  @override
  @JsonKey(ignore: true)
  _$$_ChapterPageCopyWith<_$_ChapterPage> get copyWith =>
      throw _privateConstructorUsedError;
}
