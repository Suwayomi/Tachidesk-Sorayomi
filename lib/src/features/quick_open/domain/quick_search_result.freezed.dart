// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuickSearchResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prefill, String? pattern, String hintText)
        helpText,
    required TResult Function(Source source) source,
    required TResult Function(Source source, String query) sourceSearch,
    required TResult Function(Category category) category,
    required TResult Function(Category category, Manga manga) categoryManga,
    required TResult Function(Category? category, Manga manga, Chapter chapter)
        categoryMangaChapter,
    required TResult Function(Source? source, Manga manga) manga,
    required TResult Function(Source? source, Manga manga, Chapter chapter)
        chapter,
    required TResult Function() globalSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult? Function(Source source)? source,
    TResult? Function(Source source, String query)? sourceSearch,
    TResult? Function(Category category)? category,
    TResult? Function(Category category, Manga manga)? categoryManga,
    TResult? Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult? Function(Source? source, Manga manga)? manga,
    TResult? Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult? Function()? globalSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult Function(Source source)? source,
    TResult Function(Source source, String query)? sourceSearch,
    TResult Function(Category category)? category,
    TResult Function(Category category, Manga manga)? categoryManga,
    TResult Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult Function(Source? source, Manga manga)? manga,
    TResult Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult Function()? globalSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HelpTextQuickSearchResult value) helpText,
    required TResult Function(SourceQuickSearchResult value) source,
    required TResult Function(SourceSearchQuickSearchResult value) sourceSearch,
    required TResult Function(CategoryQuickSearchResult value) category,
    required TResult Function(CategoryMangaQuickSearchResult value)
        categoryManga,
    required TResult Function(CategoryMangaChapterQuickSearchResult value)
        categoryMangaChapter,
    required TResult Function(MangaQuickSearchResult value) manga,
    required TResult Function(ChapterQuickSearchResult value) chapter,
    required TResult Function(GlobalSearchQuickSearchResult value) globalSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HelpTextQuickSearchResult value)? helpText,
    TResult? Function(SourceQuickSearchResult value)? source,
    TResult? Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult? Function(CategoryQuickSearchResult value)? category,
    TResult? Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult? Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult? Function(MangaQuickSearchResult value)? manga,
    TResult? Function(ChapterQuickSearchResult value)? chapter,
    TResult? Function(GlobalSearchQuickSearchResult value)? globalSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HelpTextQuickSearchResult value)? helpText,
    TResult Function(SourceQuickSearchResult value)? source,
    TResult Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult Function(CategoryQuickSearchResult value)? category,
    TResult Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult Function(MangaQuickSearchResult value)? manga,
    TResult Function(ChapterQuickSearchResult value)? chapter,
    TResult Function(GlobalSearchQuickSearchResult value)? globalSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickSearchResultCopyWith<$Res> {
  factory $QuickSearchResultCopyWith(
          QuickSearchResult value, $Res Function(QuickSearchResult) then) =
      _$QuickSearchResultCopyWithImpl<$Res, QuickSearchResult>;
}

/// @nodoc
class _$QuickSearchResultCopyWithImpl<$Res, $Val extends QuickSearchResult>
    implements $QuickSearchResultCopyWith<$Res> {
  _$QuickSearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HelpTextQuickSearchResultCopyWith<$Res> {
  factory _$$HelpTextQuickSearchResultCopyWith(
          _$HelpTextQuickSearchResult value,
          $Res Function(_$HelpTextQuickSearchResult) then) =
      __$$HelpTextQuickSearchResultCopyWithImpl<$Res>;
  @useResult
  $Res call({String prefill, String? pattern, String hintText});
}

/// @nodoc
class __$$HelpTextQuickSearchResultCopyWithImpl<$Res>
    extends _$QuickSearchResultCopyWithImpl<$Res, _$HelpTextQuickSearchResult>
    implements _$$HelpTextQuickSearchResultCopyWith<$Res> {
  __$$HelpTextQuickSearchResultCopyWithImpl(_$HelpTextQuickSearchResult _value,
      $Res Function(_$HelpTextQuickSearchResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefill = null,
    Object? pattern = freezed,
    Object? hintText = null,
  }) {
    return _then(_$HelpTextQuickSearchResult(
      prefill: null == prefill
          ? _value.prefill
          : prefill // ignore: cast_nullable_to_non_nullable
              as String,
      pattern: freezed == pattern
          ? _value.pattern
          : pattern // ignore: cast_nullable_to_non_nullable
              as String?,
      hintText: null == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HelpTextQuickSearchResult implements HelpTextQuickSearchResult {
  const _$HelpTextQuickSearchResult(
      {required this.prefill, this.pattern, required this.hintText});

  @override
  final String prefill;
  @override
  final String? pattern;
  @override
  final String hintText;

  @override
  String toString() {
    return 'QuickSearchResult.helpText(prefill: $prefill, pattern: $pattern, hintText: $hintText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelpTextQuickSearchResult &&
            (identical(other.prefill, prefill) || other.prefill == prefill) &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.hintText, hintText) ||
                other.hintText == hintText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, prefill, pattern, hintText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HelpTextQuickSearchResultCopyWith<_$HelpTextQuickSearchResult>
      get copyWith => __$$HelpTextQuickSearchResultCopyWithImpl<
          _$HelpTextQuickSearchResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prefill, String? pattern, String hintText)
        helpText,
    required TResult Function(Source source) source,
    required TResult Function(Source source, String query) sourceSearch,
    required TResult Function(Category category) category,
    required TResult Function(Category category, Manga manga) categoryManga,
    required TResult Function(Category? category, Manga manga, Chapter chapter)
        categoryMangaChapter,
    required TResult Function(Source? source, Manga manga) manga,
    required TResult Function(Source? source, Manga manga, Chapter chapter)
        chapter,
    required TResult Function() globalSearch,
  }) {
    return helpText(prefill, pattern, hintText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult? Function(Source source)? source,
    TResult? Function(Source source, String query)? sourceSearch,
    TResult? Function(Category category)? category,
    TResult? Function(Category category, Manga manga)? categoryManga,
    TResult? Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult? Function(Source? source, Manga manga)? manga,
    TResult? Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult? Function()? globalSearch,
  }) {
    return helpText?.call(prefill, pattern, hintText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult Function(Source source)? source,
    TResult Function(Source source, String query)? sourceSearch,
    TResult Function(Category category)? category,
    TResult Function(Category category, Manga manga)? categoryManga,
    TResult Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult Function(Source? source, Manga manga)? manga,
    TResult Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult Function()? globalSearch,
    required TResult orElse(),
  }) {
    if (helpText != null) {
      return helpText(prefill, pattern, hintText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HelpTextQuickSearchResult value) helpText,
    required TResult Function(SourceQuickSearchResult value) source,
    required TResult Function(SourceSearchQuickSearchResult value) sourceSearch,
    required TResult Function(CategoryQuickSearchResult value) category,
    required TResult Function(CategoryMangaQuickSearchResult value)
        categoryManga,
    required TResult Function(CategoryMangaChapterQuickSearchResult value)
        categoryMangaChapter,
    required TResult Function(MangaQuickSearchResult value) manga,
    required TResult Function(ChapterQuickSearchResult value) chapter,
    required TResult Function(GlobalSearchQuickSearchResult value) globalSearch,
  }) {
    return helpText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HelpTextQuickSearchResult value)? helpText,
    TResult? Function(SourceQuickSearchResult value)? source,
    TResult? Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult? Function(CategoryQuickSearchResult value)? category,
    TResult? Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult? Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult? Function(MangaQuickSearchResult value)? manga,
    TResult? Function(ChapterQuickSearchResult value)? chapter,
    TResult? Function(GlobalSearchQuickSearchResult value)? globalSearch,
  }) {
    return helpText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HelpTextQuickSearchResult value)? helpText,
    TResult Function(SourceQuickSearchResult value)? source,
    TResult Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult Function(CategoryQuickSearchResult value)? category,
    TResult Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult Function(MangaQuickSearchResult value)? manga,
    TResult Function(ChapterQuickSearchResult value)? chapter,
    TResult Function(GlobalSearchQuickSearchResult value)? globalSearch,
    required TResult orElse(),
  }) {
    if (helpText != null) {
      return helpText(this);
    }
    return orElse();
  }
}

abstract class HelpTextQuickSearchResult implements QuickSearchResult {
  const factory HelpTextQuickSearchResult(
      {required final String prefill,
      final String? pattern,
      required final String hintText}) = _$HelpTextQuickSearchResult;

  String get prefill;
  String? get pattern;
  String get hintText;
  @JsonKey(ignore: true)
  _$$HelpTextQuickSearchResultCopyWith<_$HelpTextQuickSearchResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SourceQuickSearchResultCopyWith<$Res> {
  factory _$$SourceQuickSearchResultCopyWith(_$SourceQuickSearchResult value,
          $Res Function(_$SourceQuickSearchResult) then) =
      __$$SourceQuickSearchResultCopyWithImpl<$Res>;
  @useResult
  $Res call({Source source});

  $SourceCopyWith<$Res> get source;
}

/// @nodoc
class __$$SourceQuickSearchResultCopyWithImpl<$Res>
    extends _$QuickSearchResultCopyWithImpl<$Res, _$SourceQuickSearchResult>
    implements _$$SourceQuickSearchResultCopyWith<$Res> {
  __$$SourceQuickSearchResultCopyWithImpl(_$SourceQuickSearchResult _value,
      $Res Function(_$SourceQuickSearchResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$SourceQuickSearchResult(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceCopyWith<$Res> get source {
    return $SourceCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value));
    });
  }
}

/// @nodoc

class _$SourceQuickSearchResult implements SourceQuickSearchResult {
  const _$SourceQuickSearchResult({required this.source});

  @override
  final Source source;

  @override
  String toString() {
    return 'QuickSearchResult.source(source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceQuickSearchResult &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceQuickSearchResultCopyWith<_$SourceQuickSearchResult> get copyWith =>
      __$$SourceQuickSearchResultCopyWithImpl<_$SourceQuickSearchResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prefill, String? pattern, String hintText)
        helpText,
    required TResult Function(Source source) source,
    required TResult Function(Source source, String query) sourceSearch,
    required TResult Function(Category category) category,
    required TResult Function(Category category, Manga manga) categoryManga,
    required TResult Function(Category? category, Manga manga, Chapter chapter)
        categoryMangaChapter,
    required TResult Function(Source? source, Manga manga) manga,
    required TResult Function(Source? source, Manga manga, Chapter chapter)
        chapter,
    required TResult Function() globalSearch,
  }) {
    return source(this.source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult? Function(Source source)? source,
    TResult? Function(Source source, String query)? sourceSearch,
    TResult? Function(Category category)? category,
    TResult? Function(Category category, Manga manga)? categoryManga,
    TResult? Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult? Function(Source? source, Manga manga)? manga,
    TResult? Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult? Function()? globalSearch,
  }) {
    return source?.call(this.source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult Function(Source source)? source,
    TResult Function(Source source, String query)? sourceSearch,
    TResult Function(Category category)? category,
    TResult Function(Category category, Manga manga)? categoryManga,
    TResult Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult Function(Source? source, Manga manga)? manga,
    TResult Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult Function()? globalSearch,
    required TResult orElse(),
  }) {
    if (source != null) {
      return source(this.source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HelpTextQuickSearchResult value) helpText,
    required TResult Function(SourceQuickSearchResult value) source,
    required TResult Function(SourceSearchQuickSearchResult value) sourceSearch,
    required TResult Function(CategoryQuickSearchResult value) category,
    required TResult Function(CategoryMangaQuickSearchResult value)
        categoryManga,
    required TResult Function(CategoryMangaChapterQuickSearchResult value)
        categoryMangaChapter,
    required TResult Function(MangaQuickSearchResult value) manga,
    required TResult Function(ChapterQuickSearchResult value) chapter,
    required TResult Function(GlobalSearchQuickSearchResult value) globalSearch,
  }) {
    return source(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HelpTextQuickSearchResult value)? helpText,
    TResult? Function(SourceQuickSearchResult value)? source,
    TResult? Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult? Function(CategoryQuickSearchResult value)? category,
    TResult? Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult? Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult? Function(MangaQuickSearchResult value)? manga,
    TResult? Function(ChapterQuickSearchResult value)? chapter,
    TResult? Function(GlobalSearchQuickSearchResult value)? globalSearch,
  }) {
    return source?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HelpTextQuickSearchResult value)? helpText,
    TResult Function(SourceQuickSearchResult value)? source,
    TResult Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult Function(CategoryQuickSearchResult value)? category,
    TResult Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult Function(MangaQuickSearchResult value)? manga,
    TResult Function(ChapterQuickSearchResult value)? chapter,
    TResult Function(GlobalSearchQuickSearchResult value)? globalSearch,
    required TResult orElse(),
  }) {
    if (source != null) {
      return source(this);
    }
    return orElse();
  }
}

abstract class SourceQuickSearchResult implements QuickSearchResult {
  const factory SourceQuickSearchResult({required final Source source}) =
      _$SourceQuickSearchResult;

  Source get source;
  @JsonKey(ignore: true)
  _$$SourceQuickSearchResultCopyWith<_$SourceQuickSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SourceSearchQuickSearchResultCopyWith<$Res> {
  factory _$$SourceSearchQuickSearchResultCopyWith(
          _$SourceSearchQuickSearchResult value,
          $Res Function(_$SourceSearchQuickSearchResult) then) =
      __$$SourceSearchQuickSearchResultCopyWithImpl<$Res>;
  @useResult
  $Res call({Source source, String query});

  $SourceCopyWith<$Res> get source;
}

/// @nodoc
class __$$SourceSearchQuickSearchResultCopyWithImpl<$Res>
    extends _$QuickSearchResultCopyWithImpl<$Res,
        _$SourceSearchQuickSearchResult>
    implements _$$SourceSearchQuickSearchResultCopyWith<$Res> {
  __$$SourceSearchQuickSearchResultCopyWithImpl(
      _$SourceSearchQuickSearchResult _value,
      $Res Function(_$SourceSearchQuickSearchResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? query = null,
  }) {
    return _then(_$SourceSearchQuickSearchResult(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceCopyWith<$Res> get source {
    return $SourceCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value));
    });
  }
}

/// @nodoc

class _$SourceSearchQuickSearchResult implements SourceSearchQuickSearchResult {
  const _$SourceSearchQuickSearchResult(
      {required this.source, required this.query});

  @override
  final Source source;
  @override
  final String query;

  @override
  String toString() {
    return 'QuickSearchResult.sourceSearch(source: $source, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceSearchQuickSearchResult &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceSearchQuickSearchResultCopyWith<_$SourceSearchQuickSearchResult>
      get copyWith => __$$SourceSearchQuickSearchResultCopyWithImpl<
          _$SourceSearchQuickSearchResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prefill, String? pattern, String hintText)
        helpText,
    required TResult Function(Source source) source,
    required TResult Function(Source source, String query) sourceSearch,
    required TResult Function(Category category) category,
    required TResult Function(Category category, Manga manga) categoryManga,
    required TResult Function(Category? category, Manga manga, Chapter chapter)
        categoryMangaChapter,
    required TResult Function(Source? source, Manga manga) manga,
    required TResult Function(Source? source, Manga manga, Chapter chapter)
        chapter,
    required TResult Function() globalSearch,
  }) {
    return sourceSearch(this.source, query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult? Function(Source source)? source,
    TResult? Function(Source source, String query)? sourceSearch,
    TResult? Function(Category category)? category,
    TResult? Function(Category category, Manga manga)? categoryManga,
    TResult? Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult? Function(Source? source, Manga manga)? manga,
    TResult? Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult? Function()? globalSearch,
  }) {
    return sourceSearch?.call(this.source, query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult Function(Source source)? source,
    TResult Function(Source source, String query)? sourceSearch,
    TResult Function(Category category)? category,
    TResult Function(Category category, Manga manga)? categoryManga,
    TResult Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult Function(Source? source, Manga manga)? manga,
    TResult Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult Function()? globalSearch,
    required TResult orElse(),
  }) {
    if (sourceSearch != null) {
      return sourceSearch(this.source, query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HelpTextQuickSearchResult value) helpText,
    required TResult Function(SourceQuickSearchResult value) source,
    required TResult Function(SourceSearchQuickSearchResult value) sourceSearch,
    required TResult Function(CategoryQuickSearchResult value) category,
    required TResult Function(CategoryMangaQuickSearchResult value)
        categoryManga,
    required TResult Function(CategoryMangaChapterQuickSearchResult value)
        categoryMangaChapter,
    required TResult Function(MangaQuickSearchResult value) manga,
    required TResult Function(ChapterQuickSearchResult value) chapter,
    required TResult Function(GlobalSearchQuickSearchResult value) globalSearch,
  }) {
    return sourceSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HelpTextQuickSearchResult value)? helpText,
    TResult? Function(SourceQuickSearchResult value)? source,
    TResult? Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult? Function(CategoryQuickSearchResult value)? category,
    TResult? Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult? Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult? Function(MangaQuickSearchResult value)? manga,
    TResult? Function(ChapterQuickSearchResult value)? chapter,
    TResult? Function(GlobalSearchQuickSearchResult value)? globalSearch,
  }) {
    return sourceSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HelpTextQuickSearchResult value)? helpText,
    TResult Function(SourceQuickSearchResult value)? source,
    TResult Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult Function(CategoryQuickSearchResult value)? category,
    TResult Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult Function(MangaQuickSearchResult value)? manga,
    TResult Function(ChapterQuickSearchResult value)? chapter,
    TResult Function(GlobalSearchQuickSearchResult value)? globalSearch,
    required TResult orElse(),
  }) {
    if (sourceSearch != null) {
      return sourceSearch(this);
    }
    return orElse();
  }
}

abstract class SourceSearchQuickSearchResult implements QuickSearchResult {
  const factory SourceSearchQuickSearchResult(
      {required final Source source,
      required final String query}) = _$SourceSearchQuickSearchResult;

  Source get source;
  String get query;
  @JsonKey(ignore: true)
  _$$SourceSearchQuickSearchResultCopyWith<_$SourceSearchQuickSearchResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryQuickSearchResultCopyWith<$Res> {
  factory _$$CategoryQuickSearchResultCopyWith(
          _$CategoryQuickSearchResult value,
          $Res Function(_$CategoryQuickSearchResult) then) =
      __$$CategoryQuickSearchResultCopyWithImpl<$Res>;
  @useResult
  $Res call({Category category});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$CategoryQuickSearchResultCopyWithImpl<$Res>
    extends _$QuickSearchResultCopyWithImpl<$Res, _$CategoryQuickSearchResult>
    implements _$$CategoryQuickSearchResultCopyWith<$Res> {
  __$$CategoryQuickSearchResultCopyWithImpl(_$CategoryQuickSearchResult _value,
      $Res Function(_$CategoryQuickSearchResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$CategoryQuickSearchResult(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc

class _$CategoryQuickSearchResult implements CategoryQuickSearchResult {
  const _$CategoryQuickSearchResult({required this.category});

  @override
  final Category category;

  @override
  String toString() {
    return 'QuickSearchResult.category(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryQuickSearchResult &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryQuickSearchResultCopyWith<_$CategoryQuickSearchResult>
      get copyWith => __$$CategoryQuickSearchResultCopyWithImpl<
          _$CategoryQuickSearchResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prefill, String? pattern, String hintText)
        helpText,
    required TResult Function(Source source) source,
    required TResult Function(Source source, String query) sourceSearch,
    required TResult Function(Category category) category,
    required TResult Function(Category category, Manga manga) categoryManga,
    required TResult Function(Category? category, Manga manga, Chapter chapter)
        categoryMangaChapter,
    required TResult Function(Source? source, Manga manga) manga,
    required TResult Function(Source? source, Manga manga, Chapter chapter)
        chapter,
    required TResult Function() globalSearch,
  }) {
    return category(this.category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult? Function(Source source)? source,
    TResult? Function(Source source, String query)? sourceSearch,
    TResult? Function(Category category)? category,
    TResult? Function(Category category, Manga manga)? categoryManga,
    TResult? Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult? Function(Source? source, Manga manga)? manga,
    TResult? Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult? Function()? globalSearch,
  }) {
    return category?.call(this.category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult Function(Source source)? source,
    TResult Function(Source source, String query)? sourceSearch,
    TResult Function(Category category)? category,
    TResult Function(Category category, Manga manga)? categoryManga,
    TResult Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult Function(Source? source, Manga manga)? manga,
    TResult Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult Function()? globalSearch,
    required TResult orElse(),
  }) {
    if (category != null) {
      return category(this.category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HelpTextQuickSearchResult value) helpText,
    required TResult Function(SourceQuickSearchResult value) source,
    required TResult Function(SourceSearchQuickSearchResult value) sourceSearch,
    required TResult Function(CategoryQuickSearchResult value) category,
    required TResult Function(CategoryMangaQuickSearchResult value)
        categoryManga,
    required TResult Function(CategoryMangaChapterQuickSearchResult value)
        categoryMangaChapter,
    required TResult Function(MangaQuickSearchResult value) manga,
    required TResult Function(ChapterQuickSearchResult value) chapter,
    required TResult Function(GlobalSearchQuickSearchResult value) globalSearch,
  }) {
    return category(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HelpTextQuickSearchResult value)? helpText,
    TResult? Function(SourceQuickSearchResult value)? source,
    TResult? Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult? Function(CategoryQuickSearchResult value)? category,
    TResult? Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult? Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult? Function(MangaQuickSearchResult value)? manga,
    TResult? Function(ChapterQuickSearchResult value)? chapter,
    TResult? Function(GlobalSearchQuickSearchResult value)? globalSearch,
  }) {
    return category?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HelpTextQuickSearchResult value)? helpText,
    TResult Function(SourceQuickSearchResult value)? source,
    TResult Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult Function(CategoryQuickSearchResult value)? category,
    TResult Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult Function(MangaQuickSearchResult value)? manga,
    TResult Function(ChapterQuickSearchResult value)? chapter,
    TResult Function(GlobalSearchQuickSearchResult value)? globalSearch,
    required TResult orElse(),
  }) {
    if (category != null) {
      return category(this);
    }
    return orElse();
  }
}

abstract class CategoryQuickSearchResult implements QuickSearchResult {
  const factory CategoryQuickSearchResult({required final Category category}) =
      _$CategoryQuickSearchResult;

  Category get category;
  @JsonKey(ignore: true)
  _$$CategoryQuickSearchResultCopyWith<_$CategoryQuickSearchResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryMangaQuickSearchResultCopyWith<$Res> {
  factory _$$CategoryMangaQuickSearchResultCopyWith(
          _$CategoryMangaQuickSearchResult value,
          $Res Function(_$CategoryMangaQuickSearchResult) then) =
      __$$CategoryMangaQuickSearchResultCopyWithImpl<$Res>;
  @useResult
  $Res call({Category category, Manga manga});

  $CategoryCopyWith<$Res> get category;
  $MangaCopyWith<$Res> get manga;
}

/// @nodoc
class __$$CategoryMangaQuickSearchResultCopyWithImpl<$Res>
    extends _$QuickSearchResultCopyWithImpl<$Res,
        _$CategoryMangaQuickSearchResult>
    implements _$$CategoryMangaQuickSearchResultCopyWith<$Res> {
  __$$CategoryMangaQuickSearchResultCopyWithImpl(
      _$CategoryMangaQuickSearchResult _value,
      $Res Function(_$CategoryMangaQuickSearchResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? manga = null,
  }) {
    return _then(_$CategoryMangaQuickSearchResult(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      manga: null == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MangaCopyWith<$Res> get manga {
    return $MangaCopyWith<$Res>(_value.manga, (value) {
      return _then(_value.copyWith(manga: value));
    });
  }
}

/// @nodoc

class _$CategoryMangaQuickSearchResult
    implements CategoryMangaQuickSearchResult {
  const _$CategoryMangaQuickSearchResult(
      {required this.category, required this.manga});

  @override
  final Category category;
  @override
  final Manga manga;

  @override
  String toString() {
    return 'QuickSearchResult.categoryManga(category: $category, manga: $manga)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryMangaQuickSearchResult &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.manga, manga) || other.manga == manga));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, manga);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryMangaQuickSearchResultCopyWith<_$CategoryMangaQuickSearchResult>
      get copyWith => __$$CategoryMangaQuickSearchResultCopyWithImpl<
          _$CategoryMangaQuickSearchResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prefill, String? pattern, String hintText)
        helpText,
    required TResult Function(Source source) source,
    required TResult Function(Source source, String query) sourceSearch,
    required TResult Function(Category category) category,
    required TResult Function(Category category, Manga manga) categoryManga,
    required TResult Function(Category? category, Manga manga, Chapter chapter)
        categoryMangaChapter,
    required TResult Function(Source? source, Manga manga) manga,
    required TResult Function(Source? source, Manga manga, Chapter chapter)
        chapter,
    required TResult Function() globalSearch,
  }) {
    return categoryManga(this.category, this.manga);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult? Function(Source source)? source,
    TResult? Function(Source source, String query)? sourceSearch,
    TResult? Function(Category category)? category,
    TResult? Function(Category category, Manga manga)? categoryManga,
    TResult? Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult? Function(Source? source, Manga manga)? manga,
    TResult? Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult? Function()? globalSearch,
  }) {
    return categoryManga?.call(this.category, this.manga);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult Function(Source source)? source,
    TResult Function(Source source, String query)? sourceSearch,
    TResult Function(Category category)? category,
    TResult Function(Category category, Manga manga)? categoryManga,
    TResult Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult Function(Source? source, Manga manga)? manga,
    TResult Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult Function()? globalSearch,
    required TResult orElse(),
  }) {
    if (categoryManga != null) {
      return categoryManga(this.category, this.manga);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HelpTextQuickSearchResult value) helpText,
    required TResult Function(SourceQuickSearchResult value) source,
    required TResult Function(SourceSearchQuickSearchResult value) sourceSearch,
    required TResult Function(CategoryQuickSearchResult value) category,
    required TResult Function(CategoryMangaQuickSearchResult value)
        categoryManga,
    required TResult Function(CategoryMangaChapterQuickSearchResult value)
        categoryMangaChapter,
    required TResult Function(MangaQuickSearchResult value) manga,
    required TResult Function(ChapterQuickSearchResult value) chapter,
    required TResult Function(GlobalSearchQuickSearchResult value) globalSearch,
  }) {
    return categoryManga(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HelpTextQuickSearchResult value)? helpText,
    TResult? Function(SourceQuickSearchResult value)? source,
    TResult? Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult? Function(CategoryQuickSearchResult value)? category,
    TResult? Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult? Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult? Function(MangaQuickSearchResult value)? manga,
    TResult? Function(ChapterQuickSearchResult value)? chapter,
    TResult? Function(GlobalSearchQuickSearchResult value)? globalSearch,
  }) {
    return categoryManga?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HelpTextQuickSearchResult value)? helpText,
    TResult Function(SourceQuickSearchResult value)? source,
    TResult Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult Function(CategoryQuickSearchResult value)? category,
    TResult Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult Function(MangaQuickSearchResult value)? manga,
    TResult Function(ChapterQuickSearchResult value)? chapter,
    TResult Function(GlobalSearchQuickSearchResult value)? globalSearch,
    required TResult orElse(),
  }) {
    if (categoryManga != null) {
      return categoryManga(this);
    }
    return orElse();
  }
}

abstract class CategoryMangaQuickSearchResult implements QuickSearchResult {
  const factory CategoryMangaQuickSearchResult(
      {required final Category category,
      required final Manga manga}) = _$CategoryMangaQuickSearchResult;

  Category get category;
  Manga get manga;
  @JsonKey(ignore: true)
  _$$CategoryMangaQuickSearchResultCopyWith<_$CategoryMangaQuickSearchResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryMangaChapterQuickSearchResultCopyWith<$Res> {
  factory _$$CategoryMangaChapterQuickSearchResultCopyWith(
          _$CategoryMangaChapterQuickSearchResult value,
          $Res Function(_$CategoryMangaChapterQuickSearchResult) then) =
      __$$CategoryMangaChapterQuickSearchResultCopyWithImpl<$Res>;
  @useResult
  $Res call({Category? category, Manga manga, Chapter chapter});

  $CategoryCopyWith<$Res>? get category;
  $MangaCopyWith<$Res> get manga;
  $ChapterCopyWith<$Res> get chapter;
}

/// @nodoc
class __$$CategoryMangaChapterQuickSearchResultCopyWithImpl<$Res>
    extends _$QuickSearchResultCopyWithImpl<$Res,
        _$CategoryMangaChapterQuickSearchResult>
    implements _$$CategoryMangaChapterQuickSearchResultCopyWith<$Res> {
  __$$CategoryMangaChapterQuickSearchResultCopyWithImpl(
      _$CategoryMangaChapterQuickSearchResult _value,
      $Res Function(_$CategoryMangaChapterQuickSearchResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? manga = null,
    Object? chapter = null,
  }) {
    return _then(_$CategoryMangaChapterQuickSearchResult(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      manga: null == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MangaCopyWith<$Res> get manga {
    return $MangaCopyWith<$Res>(_value.manga, (value) {
      return _then(_value.copyWith(manga: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChapterCopyWith<$Res> get chapter {
    return $ChapterCopyWith<$Res>(_value.chapter, (value) {
      return _then(_value.copyWith(chapter: value));
    });
  }
}

/// @nodoc

class _$CategoryMangaChapterQuickSearchResult
    implements CategoryMangaChapterQuickSearchResult {
  const _$CategoryMangaChapterQuickSearchResult(
      {this.category, required this.manga, required this.chapter});

  @override
  final Category? category;
  @override
  final Manga manga;
  @override
  final Chapter chapter;

  @override
  String toString() {
    return 'QuickSearchResult.categoryMangaChapter(category: $category, manga: $manga, chapter: $chapter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryMangaChapterQuickSearchResult &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.manga, manga) || other.manga == manga) &&
            (identical(other.chapter, chapter) || other.chapter == chapter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, manga, chapter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryMangaChapterQuickSearchResultCopyWith<
          _$CategoryMangaChapterQuickSearchResult>
      get copyWith => __$$CategoryMangaChapterQuickSearchResultCopyWithImpl<
          _$CategoryMangaChapterQuickSearchResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prefill, String? pattern, String hintText)
        helpText,
    required TResult Function(Source source) source,
    required TResult Function(Source source, String query) sourceSearch,
    required TResult Function(Category category) category,
    required TResult Function(Category category, Manga manga) categoryManga,
    required TResult Function(Category? category, Manga manga, Chapter chapter)
        categoryMangaChapter,
    required TResult Function(Source? source, Manga manga) manga,
    required TResult Function(Source? source, Manga manga, Chapter chapter)
        chapter,
    required TResult Function() globalSearch,
  }) {
    return categoryMangaChapter(this.category, this.manga, this.chapter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult? Function(Source source)? source,
    TResult? Function(Source source, String query)? sourceSearch,
    TResult? Function(Category category)? category,
    TResult? Function(Category category, Manga manga)? categoryManga,
    TResult? Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult? Function(Source? source, Manga manga)? manga,
    TResult? Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult? Function()? globalSearch,
  }) {
    return categoryMangaChapter?.call(this.category, this.manga, this.chapter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult Function(Source source)? source,
    TResult Function(Source source, String query)? sourceSearch,
    TResult Function(Category category)? category,
    TResult Function(Category category, Manga manga)? categoryManga,
    TResult Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult Function(Source? source, Manga manga)? manga,
    TResult Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult Function()? globalSearch,
    required TResult orElse(),
  }) {
    if (categoryMangaChapter != null) {
      return categoryMangaChapter(this.category, this.manga, this.chapter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HelpTextQuickSearchResult value) helpText,
    required TResult Function(SourceQuickSearchResult value) source,
    required TResult Function(SourceSearchQuickSearchResult value) sourceSearch,
    required TResult Function(CategoryQuickSearchResult value) category,
    required TResult Function(CategoryMangaQuickSearchResult value)
        categoryManga,
    required TResult Function(CategoryMangaChapterQuickSearchResult value)
        categoryMangaChapter,
    required TResult Function(MangaQuickSearchResult value) manga,
    required TResult Function(ChapterQuickSearchResult value) chapter,
    required TResult Function(GlobalSearchQuickSearchResult value) globalSearch,
  }) {
    return categoryMangaChapter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HelpTextQuickSearchResult value)? helpText,
    TResult? Function(SourceQuickSearchResult value)? source,
    TResult? Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult? Function(CategoryQuickSearchResult value)? category,
    TResult? Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult? Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult? Function(MangaQuickSearchResult value)? manga,
    TResult? Function(ChapterQuickSearchResult value)? chapter,
    TResult? Function(GlobalSearchQuickSearchResult value)? globalSearch,
  }) {
    return categoryMangaChapter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HelpTextQuickSearchResult value)? helpText,
    TResult Function(SourceQuickSearchResult value)? source,
    TResult Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult Function(CategoryQuickSearchResult value)? category,
    TResult Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult Function(MangaQuickSearchResult value)? manga,
    TResult Function(ChapterQuickSearchResult value)? chapter,
    TResult Function(GlobalSearchQuickSearchResult value)? globalSearch,
    required TResult orElse(),
  }) {
    if (categoryMangaChapter != null) {
      return categoryMangaChapter(this);
    }
    return orElse();
  }
}

abstract class CategoryMangaChapterQuickSearchResult
    implements QuickSearchResult {
  const factory CategoryMangaChapterQuickSearchResult(
          {final Category? category,
          required final Manga manga,
          required final Chapter chapter}) =
      _$CategoryMangaChapterQuickSearchResult;

  Category? get category;
  Manga get manga;
  Chapter get chapter;
  @JsonKey(ignore: true)
  _$$CategoryMangaChapterQuickSearchResultCopyWith<
          _$CategoryMangaChapterQuickSearchResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MangaQuickSearchResultCopyWith<$Res> {
  factory _$$MangaQuickSearchResultCopyWith(_$MangaQuickSearchResult value,
          $Res Function(_$MangaQuickSearchResult) then) =
      __$$MangaQuickSearchResultCopyWithImpl<$Res>;
  @useResult
  $Res call({Source? source, Manga manga});

  $SourceCopyWith<$Res>? get source;
  $MangaCopyWith<$Res> get manga;
}

/// @nodoc
class __$$MangaQuickSearchResultCopyWithImpl<$Res>
    extends _$QuickSearchResultCopyWithImpl<$Res, _$MangaQuickSearchResult>
    implements _$$MangaQuickSearchResultCopyWith<$Res> {
  __$$MangaQuickSearchResultCopyWithImpl(_$MangaQuickSearchResult _value,
      $Res Function(_$MangaQuickSearchResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? manga = null,
  }) {
    return _then(_$MangaQuickSearchResult(
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
      manga: null == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SourceCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MangaCopyWith<$Res> get manga {
    return $MangaCopyWith<$Res>(_value.manga, (value) {
      return _then(_value.copyWith(manga: value));
    });
  }
}

/// @nodoc

class _$MangaQuickSearchResult implements MangaQuickSearchResult {
  const _$MangaQuickSearchResult({this.source, required this.manga});

  @override
  final Source? source;
  @override
  final Manga manga;

  @override
  String toString() {
    return 'QuickSearchResult.manga(source: $source, manga: $manga)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MangaQuickSearchResult &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.manga, manga) || other.manga == manga));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, manga);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MangaQuickSearchResultCopyWith<_$MangaQuickSearchResult> get copyWith =>
      __$$MangaQuickSearchResultCopyWithImpl<_$MangaQuickSearchResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prefill, String? pattern, String hintText)
        helpText,
    required TResult Function(Source source) source,
    required TResult Function(Source source, String query) sourceSearch,
    required TResult Function(Category category) category,
    required TResult Function(Category category, Manga manga) categoryManga,
    required TResult Function(Category? category, Manga manga, Chapter chapter)
        categoryMangaChapter,
    required TResult Function(Source? source, Manga manga) manga,
    required TResult Function(Source? source, Manga manga, Chapter chapter)
        chapter,
    required TResult Function() globalSearch,
  }) {
    return manga(this.source, this.manga);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult? Function(Source source)? source,
    TResult? Function(Source source, String query)? sourceSearch,
    TResult? Function(Category category)? category,
    TResult? Function(Category category, Manga manga)? categoryManga,
    TResult? Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult? Function(Source? source, Manga manga)? manga,
    TResult? Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult? Function()? globalSearch,
  }) {
    return manga?.call(this.source, this.manga);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult Function(Source source)? source,
    TResult Function(Source source, String query)? sourceSearch,
    TResult Function(Category category)? category,
    TResult Function(Category category, Manga manga)? categoryManga,
    TResult Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult Function(Source? source, Manga manga)? manga,
    TResult Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult Function()? globalSearch,
    required TResult orElse(),
  }) {
    if (manga != null) {
      return manga(this.source, this.manga);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HelpTextQuickSearchResult value) helpText,
    required TResult Function(SourceQuickSearchResult value) source,
    required TResult Function(SourceSearchQuickSearchResult value) sourceSearch,
    required TResult Function(CategoryQuickSearchResult value) category,
    required TResult Function(CategoryMangaQuickSearchResult value)
        categoryManga,
    required TResult Function(CategoryMangaChapterQuickSearchResult value)
        categoryMangaChapter,
    required TResult Function(MangaQuickSearchResult value) manga,
    required TResult Function(ChapterQuickSearchResult value) chapter,
    required TResult Function(GlobalSearchQuickSearchResult value) globalSearch,
  }) {
    return manga(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HelpTextQuickSearchResult value)? helpText,
    TResult? Function(SourceQuickSearchResult value)? source,
    TResult? Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult? Function(CategoryQuickSearchResult value)? category,
    TResult? Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult? Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult? Function(MangaQuickSearchResult value)? manga,
    TResult? Function(ChapterQuickSearchResult value)? chapter,
    TResult? Function(GlobalSearchQuickSearchResult value)? globalSearch,
  }) {
    return manga?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HelpTextQuickSearchResult value)? helpText,
    TResult Function(SourceQuickSearchResult value)? source,
    TResult Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult Function(CategoryQuickSearchResult value)? category,
    TResult Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult Function(MangaQuickSearchResult value)? manga,
    TResult Function(ChapterQuickSearchResult value)? chapter,
    TResult Function(GlobalSearchQuickSearchResult value)? globalSearch,
    required TResult orElse(),
  }) {
    if (manga != null) {
      return manga(this);
    }
    return orElse();
  }
}

abstract class MangaQuickSearchResult implements QuickSearchResult {
  const factory MangaQuickSearchResult(
      {final Source? source,
      required final Manga manga}) = _$MangaQuickSearchResult;

  Source? get source;
  Manga get manga;
  @JsonKey(ignore: true)
  _$$MangaQuickSearchResultCopyWith<_$MangaQuickSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChapterQuickSearchResultCopyWith<$Res> {
  factory _$$ChapterQuickSearchResultCopyWith(_$ChapterQuickSearchResult value,
          $Res Function(_$ChapterQuickSearchResult) then) =
      __$$ChapterQuickSearchResultCopyWithImpl<$Res>;
  @useResult
  $Res call({Source? source, Manga manga, Chapter chapter});

  $SourceCopyWith<$Res>? get source;
  $MangaCopyWith<$Res> get manga;
  $ChapterCopyWith<$Res> get chapter;
}

/// @nodoc
class __$$ChapterQuickSearchResultCopyWithImpl<$Res>
    extends _$QuickSearchResultCopyWithImpl<$Res, _$ChapterQuickSearchResult>
    implements _$$ChapterQuickSearchResultCopyWith<$Res> {
  __$$ChapterQuickSearchResultCopyWithImpl(_$ChapterQuickSearchResult _value,
      $Res Function(_$ChapterQuickSearchResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? manga = null,
    Object? chapter = null,
  }) {
    return _then(_$ChapterQuickSearchResult(
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
      manga: null == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as Manga,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SourceCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MangaCopyWith<$Res> get manga {
    return $MangaCopyWith<$Res>(_value.manga, (value) {
      return _then(_value.copyWith(manga: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChapterCopyWith<$Res> get chapter {
    return $ChapterCopyWith<$Res>(_value.chapter, (value) {
      return _then(_value.copyWith(chapter: value));
    });
  }
}

/// @nodoc

class _$ChapterQuickSearchResult implements ChapterQuickSearchResult {
  const _$ChapterQuickSearchResult(
      {this.source, required this.manga, required this.chapter});

  @override
  final Source? source;
  @override
  final Manga manga;
  @override
  final Chapter chapter;

  @override
  String toString() {
    return 'QuickSearchResult.chapter(source: $source, manga: $manga, chapter: $chapter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterQuickSearchResult &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.manga, manga) || other.manga == manga) &&
            (identical(other.chapter, chapter) || other.chapter == chapter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, manga, chapter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterQuickSearchResultCopyWith<_$ChapterQuickSearchResult>
      get copyWith =>
          __$$ChapterQuickSearchResultCopyWithImpl<_$ChapterQuickSearchResult>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prefill, String? pattern, String hintText)
        helpText,
    required TResult Function(Source source) source,
    required TResult Function(Source source, String query) sourceSearch,
    required TResult Function(Category category) category,
    required TResult Function(Category category, Manga manga) categoryManga,
    required TResult Function(Category? category, Manga manga, Chapter chapter)
        categoryMangaChapter,
    required TResult Function(Source? source, Manga manga) manga,
    required TResult Function(Source? source, Manga manga, Chapter chapter)
        chapter,
    required TResult Function() globalSearch,
  }) {
    return chapter(this.source, this.manga, this.chapter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult? Function(Source source)? source,
    TResult? Function(Source source, String query)? sourceSearch,
    TResult? Function(Category category)? category,
    TResult? Function(Category category, Manga manga)? categoryManga,
    TResult? Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult? Function(Source? source, Manga manga)? manga,
    TResult? Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult? Function()? globalSearch,
  }) {
    return chapter?.call(this.source, this.manga, this.chapter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult Function(Source source)? source,
    TResult Function(Source source, String query)? sourceSearch,
    TResult Function(Category category)? category,
    TResult Function(Category category, Manga manga)? categoryManga,
    TResult Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult Function(Source? source, Manga manga)? manga,
    TResult Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult Function()? globalSearch,
    required TResult orElse(),
  }) {
    if (chapter != null) {
      return chapter(this.source, this.manga, this.chapter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HelpTextQuickSearchResult value) helpText,
    required TResult Function(SourceQuickSearchResult value) source,
    required TResult Function(SourceSearchQuickSearchResult value) sourceSearch,
    required TResult Function(CategoryQuickSearchResult value) category,
    required TResult Function(CategoryMangaQuickSearchResult value)
        categoryManga,
    required TResult Function(CategoryMangaChapterQuickSearchResult value)
        categoryMangaChapter,
    required TResult Function(MangaQuickSearchResult value) manga,
    required TResult Function(ChapterQuickSearchResult value) chapter,
    required TResult Function(GlobalSearchQuickSearchResult value) globalSearch,
  }) {
    return chapter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HelpTextQuickSearchResult value)? helpText,
    TResult? Function(SourceQuickSearchResult value)? source,
    TResult? Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult? Function(CategoryQuickSearchResult value)? category,
    TResult? Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult? Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult? Function(MangaQuickSearchResult value)? manga,
    TResult? Function(ChapterQuickSearchResult value)? chapter,
    TResult? Function(GlobalSearchQuickSearchResult value)? globalSearch,
  }) {
    return chapter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HelpTextQuickSearchResult value)? helpText,
    TResult Function(SourceQuickSearchResult value)? source,
    TResult Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult Function(CategoryQuickSearchResult value)? category,
    TResult Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult Function(MangaQuickSearchResult value)? manga,
    TResult Function(ChapterQuickSearchResult value)? chapter,
    TResult Function(GlobalSearchQuickSearchResult value)? globalSearch,
    required TResult orElse(),
  }) {
    if (chapter != null) {
      return chapter(this);
    }
    return orElse();
  }
}

abstract class ChapterQuickSearchResult implements QuickSearchResult {
  const factory ChapterQuickSearchResult(
      {final Source? source,
      required final Manga manga,
      required final Chapter chapter}) = _$ChapterQuickSearchResult;

  Source? get source;
  Manga get manga;
  Chapter get chapter;
  @JsonKey(ignore: true)
  _$$ChapterQuickSearchResultCopyWith<_$ChapterQuickSearchResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GlobalSearchQuickSearchResultCopyWith<$Res> {
  factory _$$GlobalSearchQuickSearchResultCopyWith(
          _$GlobalSearchQuickSearchResult value,
          $Res Function(_$GlobalSearchQuickSearchResult) then) =
      __$$GlobalSearchQuickSearchResultCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GlobalSearchQuickSearchResultCopyWithImpl<$Res>
    extends _$QuickSearchResultCopyWithImpl<$Res,
        _$GlobalSearchQuickSearchResult>
    implements _$$GlobalSearchQuickSearchResultCopyWith<$Res> {
  __$$GlobalSearchQuickSearchResultCopyWithImpl(
      _$GlobalSearchQuickSearchResult _value,
      $Res Function(_$GlobalSearchQuickSearchResult) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GlobalSearchQuickSearchResult implements GlobalSearchQuickSearchResult {
  const _$GlobalSearchQuickSearchResult();

  @override
  String toString() {
    return 'QuickSearchResult.globalSearch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalSearchQuickSearchResult);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prefill, String? pattern, String hintText)
        helpText,
    required TResult Function(Source source) source,
    required TResult Function(Source source, String query) sourceSearch,
    required TResult Function(Category category) category,
    required TResult Function(Category category, Manga manga) categoryManga,
    required TResult Function(Category? category, Manga manga, Chapter chapter)
        categoryMangaChapter,
    required TResult Function(Source? source, Manga manga) manga,
    required TResult Function(Source? source, Manga manga, Chapter chapter)
        chapter,
    required TResult Function() globalSearch,
  }) {
    return globalSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult? Function(Source source)? source,
    TResult? Function(Source source, String query)? sourceSearch,
    TResult? Function(Category category)? category,
    TResult? Function(Category category, Manga manga)? categoryManga,
    TResult? Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult? Function(Source? source, Manga manga)? manga,
    TResult? Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult? Function()? globalSearch,
  }) {
    return globalSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prefill, String? pattern, String hintText)?
        helpText,
    TResult Function(Source source)? source,
    TResult Function(Source source, String query)? sourceSearch,
    TResult Function(Category category)? category,
    TResult Function(Category category, Manga manga)? categoryManga,
    TResult Function(Category? category, Manga manga, Chapter chapter)?
        categoryMangaChapter,
    TResult Function(Source? source, Manga manga)? manga,
    TResult Function(Source? source, Manga manga, Chapter chapter)? chapter,
    TResult Function()? globalSearch,
    required TResult orElse(),
  }) {
    if (globalSearch != null) {
      return globalSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HelpTextQuickSearchResult value) helpText,
    required TResult Function(SourceQuickSearchResult value) source,
    required TResult Function(SourceSearchQuickSearchResult value) sourceSearch,
    required TResult Function(CategoryQuickSearchResult value) category,
    required TResult Function(CategoryMangaQuickSearchResult value)
        categoryManga,
    required TResult Function(CategoryMangaChapterQuickSearchResult value)
        categoryMangaChapter,
    required TResult Function(MangaQuickSearchResult value) manga,
    required TResult Function(ChapterQuickSearchResult value) chapter,
    required TResult Function(GlobalSearchQuickSearchResult value) globalSearch,
  }) {
    return globalSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HelpTextQuickSearchResult value)? helpText,
    TResult? Function(SourceQuickSearchResult value)? source,
    TResult? Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult? Function(CategoryQuickSearchResult value)? category,
    TResult? Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult? Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult? Function(MangaQuickSearchResult value)? manga,
    TResult? Function(ChapterQuickSearchResult value)? chapter,
    TResult? Function(GlobalSearchQuickSearchResult value)? globalSearch,
  }) {
    return globalSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HelpTextQuickSearchResult value)? helpText,
    TResult Function(SourceQuickSearchResult value)? source,
    TResult Function(SourceSearchQuickSearchResult value)? sourceSearch,
    TResult Function(CategoryQuickSearchResult value)? category,
    TResult Function(CategoryMangaQuickSearchResult value)? categoryManga,
    TResult Function(CategoryMangaChapterQuickSearchResult value)?
        categoryMangaChapter,
    TResult Function(MangaQuickSearchResult value)? manga,
    TResult Function(ChapterQuickSearchResult value)? chapter,
    TResult Function(GlobalSearchQuickSearchResult value)? globalSearch,
    required TResult orElse(),
  }) {
    if (globalSearch != null) {
      return globalSearch(this);
    }
    return orElse();
  }
}

abstract class GlobalSearchQuickSearchResult implements QuickSearchResult {
  const factory GlobalSearchQuickSearchResult() =
      _$GlobalSearchQuickSearchResult;
}
