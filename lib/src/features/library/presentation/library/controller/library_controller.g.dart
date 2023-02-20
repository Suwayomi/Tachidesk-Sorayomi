// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryMangaListWithQueryAndFilterHash() =>
    r'c7c4c6d4717fa47e57d0ada372d733ab30caa986';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CategoryMangaListWithQueryAndFilter
    extends BuildlessAutoDisposeNotifier<AsyncValue<List<Manga>?>> {
  late final int categoryId;

  AsyncValue<List<Manga>?> build({
    required int categoryId,
  });
}

/// See also [CategoryMangaListWithQueryAndFilter].
@ProviderFor(CategoryMangaListWithQueryAndFilter)
const categoryMangaListWithQueryAndFilterProvider =
    CategoryMangaListWithQueryAndFilterFamily();

/// See also [CategoryMangaListWithQueryAndFilter].
class CategoryMangaListWithQueryAndFilterFamily
    extends Family<AsyncValue<List<Manga>?>> {
  /// See also [CategoryMangaListWithQueryAndFilter].
  const CategoryMangaListWithQueryAndFilterFamily();

  /// See also [CategoryMangaListWithQueryAndFilter].
  CategoryMangaListWithQueryAndFilterProvider call({
    required int categoryId,
  }) {
    return CategoryMangaListWithQueryAndFilterProvider(
      categoryId: categoryId,
    );
  }

  @override
  CategoryMangaListWithQueryAndFilterProvider getProviderOverride(
    covariant CategoryMangaListWithQueryAndFilterProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryMangaListWithQueryAndFilterProvider';
}

/// See also [CategoryMangaListWithQueryAndFilter].
class CategoryMangaListWithQueryAndFilterProvider
    extends AutoDisposeNotifierProviderImpl<CategoryMangaListWithQueryAndFilter,
        AsyncValue<List<Manga>?>> {
  /// See also [CategoryMangaListWithQueryAndFilter].
  CategoryMangaListWithQueryAndFilterProvider({
    required this.categoryId,
  }) : super.internal(
          () => CategoryMangaListWithQueryAndFilter()..categoryId = categoryId,
          from: categoryMangaListWithQueryAndFilterProvider,
          name: r'categoryMangaListWithQueryAndFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryMangaListWithQueryAndFilterHash,
          dependencies: CategoryMangaListWithQueryAndFilterFamily._dependencies,
          allTransitiveDependencies: CategoryMangaListWithQueryAndFilterFamily
              ._allTransitiveDependencies,
        );

  final int categoryId;

  @override
  bool operator ==(Object other) {
    return other is CategoryMangaListWithQueryAndFilterProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  AsyncValue<List<Manga>?> runNotifierBuild(
    covariant CategoryMangaListWithQueryAndFilter notifier,
  ) {
    return notifier.build(
      categoryId: categoryId,
    );
  }
}

String _$libraryQueryHash() => r'84087050ef9f75c04375c648a971b67e3b0b28ba';

/// See also [LibraryQuery].
@ProviderFor(LibraryQuery)
final libraryQueryProvider =
    AutoDisposeNotifierProvider<LibraryQuery, String?>.internal(
  LibraryQuery.new,
  name: r'libraryQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$libraryQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LibraryQuery = AutoDisposeNotifier<String?>;
String _$libraryMangaFilterDownloadedHash() =>
    r'173f948640462772ba13cd4efb03b750a4b50f50';

/// See also [LibraryMangaFilterDownloaded].
@ProviderFor(LibraryMangaFilterDownloaded)
final libraryMangaFilterDownloadedProvider =
    AutoDisposeNotifierProvider<LibraryMangaFilterDownloaded, bool?>.internal(
  LibraryMangaFilterDownloaded.new,
  name: r'libraryMangaFilterDownloadedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$libraryMangaFilterDownloadedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LibraryMangaFilterDownloaded = AutoDisposeNotifier<bool?>;
String _$libraryMangaFilterUnreadHash() =>
    r'6c168a40a9e5599d8f2cb02915ff1546b5f3c531';

/// See also [LibraryMangaFilterUnread].
@ProviderFor(LibraryMangaFilterUnread)
final libraryMangaFilterUnreadProvider =
    AutoDisposeNotifierProvider<LibraryMangaFilterUnread, bool?>.internal(
  LibraryMangaFilterUnread.new,
  name: r'libraryMangaFilterUnreadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$libraryMangaFilterUnreadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LibraryMangaFilterUnread = AutoDisposeNotifier<bool?>;
String _$libraryMangaFilterCompletedHash() =>
    r'1d959032909f57d964b60cf6f86efd4e2b4960e9';

/// See also [LibraryMangaFilterCompleted].
@ProviderFor(LibraryMangaFilterCompleted)
final libraryMangaFilterCompletedProvider =
    AutoDisposeNotifierProvider<LibraryMangaFilterCompleted, bool?>.internal(
  LibraryMangaFilterCompleted.new,
  name: r'libraryMangaFilterCompletedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$libraryMangaFilterCompletedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LibraryMangaFilterCompleted = AutoDisposeNotifier<bool?>;
String _$libraryMangaSortHash() => r'88a025259f3957cb221cd1237c6e118d546eec64';

/// See also [LibraryMangaSort].
@ProviderFor(LibraryMangaSort)
final libraryMangaSortProvider =
    AutoDisposeNotifierProvider<LibraryMangaSort, MangaSort?>.internal(
  LibraryMangaSort.new,
  name: r'libraryMangaSortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$libraryMangaSortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LibraryMangaSort = AutoDisposeNotifier<MangaSort?>;
String _$libraryMangaSortDirectionHash() =>
    r'e75ba9131a09c697f6bc6488347051de72249cb2';

/// See also [LibraryMangaSortDirection].
@ProviderFor(LibraryMangaSortDirection)
final libraryMangaSortDirectionProvider =
    AutoDisposeNotifierProvider<LibraryMangaSortDirection, bool?>.internal(
  LibraryMangaSortDirection.new,
  name: r'libraryMangaSortDirectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$libraryMangaSortDirectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LibraryMangaSortDirection = AutoDisposeNotifier<bool?>;
String _$libraryDisplayModeHash() =>
    r'c7adbf4cb2db2c67b7d10e75bb14404e05551ab4';

/// See also [LibraryDisplayMode].
@ProviderFor(LibraryDisplayMode)
final libraryDisplayModeProvider =
    AutoDisposeNotifierProvider<LibraryDisplayMode, DisplayMode?>.internal(
  LibraryDisplayMode.new,
  name: r'libraryDisplayModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$libraryDisplayModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LibraryDisplayMode = AutoDisposeNotifier<DisplayMode?>;
String _$categoryMangaListHash() => r'9da0d48991ecde48dd144171ef5091fd2f597ef7';
typedef CategoryMangaListRef = AutoDisposeFutureProviderRef<List<Manga>?>;

/// See also [categoryMangaList].
@ProviderFor(categoryMangaList)
const categoryMangaListProvider = CategoryMangaListFamily();

/// See also [categoryMangaList].
class CategoryMangaListFamily extends Family<AsyncValue<List<Manga>?>> {
  /// See also [categoryMangaList].
  const CategoryMangaListFamily();

  /// See also [categoryMangaList].
  CategoryMangaListProvider call(
    int categoryId,
  ) {
    return CategoryMangaListProvider(
      categoryId,
    );
  }

  @override
  CategoryMangaListProvider getProviderOverride(
    covariant CategoryMangaListProvider provider,
  ) {
    return call(
      provider.categoryId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryMangaListProvider';
}

/// See also [categoryMangaList].
class CategoryMangaListProvider
    extends AutoDisposeFutureProvider<List<Manga>?> {
  /// See also [categoryMangaList].
  CategoryMangaListProvider(
    this.categoryId,
  ) : super.internal(
          (ref) => categoryMangaList(
            ref,
            categoryId,
          ),
          from: categoryMangaListProvider,
          name: r'categoryMangaListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryMangaListHash,
          dependencies: CategoryMangaListFamily._dependencies,
          allTransitiveDependencies:
              CategoryMangaListFamily._allTransitiveDependencies,
        );

  final int categoryId;

  @override
  bool operator ==(Object other) {
    return other is CategoryMangaListProvider && other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
