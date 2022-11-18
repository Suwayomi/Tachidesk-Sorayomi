// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String $LibraryScreenShowSearchHash() =>
    r'a3a432fd00a062d9e9a7ffb40cf57942ffee69b6';

/// See also [LibraryScreenShowSearch].
final libraryScreenShowSearchProvider =
    AutoDisposeNotifierProvider<LibraryScreenShowSearch, bool>(
  LibraryScreenShowSearch.new,
  name: r'libraryScreenShowSearchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $LibraryScreenShowSearchHash,
);
typedef LibraryScreenShowSearchRef = AutoDisposeNotifierProviderRef<bool>;

abstract class _$LibraryScreenShowSearch extends AutoDisposeNotifier<bool> {
  @override
  bool build();
}

String $CategoryMangaListWithQueryAndFilterHash() =>
    r'16b700778e835fa62a6f3db42139955f9638f5af';

/// See also [CategoryMangaListWithQueryAndFilter].
class CategoryMangaListWithQueryAndFilterProvider
    extends AutoDisposeNotifierProviderImpl<CategoryMangaListWithQueryAndFilter,
        AsyncValue<List<Manga>?>> {
  CategoryMangaListWithQueryAndFilterProvider({
    required this.categoryId,
  }) : super(
          () => CategoryMangaListWithQueryAndFilter()..categoryId = categoryId,
          from: categoryMangaListWithQueryAndFilterProvider,
          name: r'categoryMangaListWithQueryAndFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $CategoryMangaListWithQueryAndFilterHash,
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
    covariant _$CategoryMangaListWithQueryAndFilter notifier,
  ) {
    return notifier.build(
      categoryId: categoryId,
    );
  }
}

typedef CategoryMangaListWithQueryAndFilterRef
    = AutoDisposeNotifierProviderRef<AsyncValue<List<Manga>?>>;

/// See also [CategoryMangaListWithQueryAndFilter].
final categoryMangaListWithQueryAndFilterProvider =
    CategoryMangaListWithQueryAndFilterFamily();

class CategoryMangaListWithQueryAndFilterFamily
    extends Family<AsyncValue<List<Manga>?>> {
  CategoryMangaListWithQueryAndFilterFamily();

  CategoryMangaListWithQueryAndFilterProvider call({
    required int categoryId,
  }) {
    return CategoryMangaListWithQueryAndFilterProvider(
      categoryId: categoryId,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<CategoryMangaListWithQueryAndFilter,
      AsyncValue<List<Manga>?>> getProviderOverride(
    covariant CategoryMangaListWithQueryAndFilterProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'categoryMangaListWithQueryAndFilterProvider';
}

abstract class _$CategoryMangaListWithQueryAndFilter
    extends BuildlessAutoDisposeNotifier<AsyncValue<List<Manga>?>> {
  late final int categoryId;

  AsyncValue<List<Manga>?> build({
    required int categoryId,
  });
}

String $LibraryQueryHash() => r'84087050ef9f75c04375c648a971b67e3b0b28ba';

/// See also [LibraryQuery].
final libraryQueryProvider = AutoDisposeNotifierProvider<LibraryQuery, String?>(
  LibraryQuery.new,
  name: r'libraryQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $LibraryQueryHash,
);
typedef LibraryQueryRef = AutoDisposeNotifierProviderRef<String?>;

abstract class _$LibraryQuery extends AutoDisposeNotifier<String?> {
  @override
  String? build();
}

String $LibraryMangaFilterDownloadedHash() =>
    r'cce0a471a0fb501d95e45d96504029e2d780c814';

/// See also [LibraryMangaFilterDownloaded].
final libraryMangaFilterDownloadedProvider =
    AutoDisposeNotifierProvider<LibraryMangaFilterDownloaded, bool?>(
  LibraryMangaFilterDownloaded.new,
  name: r'libraryMangaFilterDownloadedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $LibraryMangaFilterDownloadedHash,
);
typedef LibraryMangaFilterDownloadedRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$LibraryMangaFilterDownloaded
    extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String $LibraryMangaFilterUnreadHash() =>
    r'f09bd1892817cd25a402ab6eba8138d5126fa78a';

/// See also [LibraryMangaFilterUnread].
final libraryMangaFilterUnreadProvider =
    AutoDisposeNotifierProvider<LibraryMangaFilterUnread, bool?>(
  LibraryMangaFilterUnread.new,
  name: r'libraryMangaFilterUnreadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $LibraryMangaFilterUnreadHash,
);
typedef LibraryMangaFilterUnreadRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$LibraryMangaFilterUnread extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String $LibraryMangaFilterCompletedHash() =>
    r'db7a3dfbb7f8a8c5ccd3c2d95a601f015129e5f2';

/// See also [LibraryMangaFilterCompleted].
final libraryMangaFilterCompletedProvider =
    AutoDisposeNotifierProvider<LibraryMangaFilterCompleted, bool?>(
  LibraryMangaFilterCompleted.new,
  name: r'libraryMangaFilterCompletedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $LibraryMangaFilterCompletedHash,
);
typedef LibraryMangaFilterCompletedRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$LibraryMangaFilterCompleted
    extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String $LibraryMangaSortHash() => r'c63ee6d134f21e7ba269a464020bbf0fc462b42c';

/// See also [LibraryMangaSort].
final libraryMangaSortProvider =
    AutoDisposeNotifierProvider<LibraryMangaSort, MangaSort?>(
  LibraryMangaSort.new,
  name: r'libraryMangaSortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $LibraryMangaSortHash,
);
typedef LibraryMangaSortRef = AutoDisposeNotifierProviderRef<MangaSort?>;

abstract class _$LibraryMangaSort extends AutoDisposeNotifier<MangaSort?> {
  @override
  MangaSort? build();
}

String $LibraryMangaSortDirectionHash() =>
    r'e2f6901360b6434e9acc1708a17ff863538a9bc1';

/// See also [LibraryMangaSortDirection].
final libraryMangaSortDirectionProvider =
    AutoDisposeNotifierProvider<LibraryMangaSortDirection, bool?>(
  LibraryMangaSortDirection.new,
  name: r'libraryMangaSortDirectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $LibraryMangaSortDirectionHash,
);
typedef LibraryMangaSortDirectionRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$LibraryMangaSortDirection extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String $LibraryDisplayModeHash() => r'dc04228b204eb3fff000b7d78c88f4e96cfa305e';

/// See also [LibraryDisplayMode].
final libraryDisplayModeProvider =
    AutoDisposeNotifierProvider<LibraryDisplayMode, DisplayMode?>(
  LibraryDisplayMode.new,
  name: r'libraryDisplayModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $LibraryDisplayModeHash,
);
typedef LibraryDisplayModeRef = AutoDisposeNotifierProviderRef<DisplayMode?>;

abstract class _$LibraryDisplayMode extends AutoDisposeNotifier<DisplayMode?> {
  @override
  DisplayMode? build();
}

String $categoryMangaListHash() => r'9da0d48991ecde48dd144171ef5091fd2f597ef7';

/// See also [categoryMangaList].
class CategoryMangaListProvider
    extends AutoDisposeFutureProvider<List<Manga>?> {
  CategoryMangaListProvider(
    this.categoryId,
  ) : super(
          (ref) => categoryMangaList(
            ref,
            categoryId,
          ),
          from: categoryMangaListProvider,
          name: r'categoryMangaListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $categoryMangaListHash,
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

typedef CategoryMangaListRef = AutoDisposeFutureProviderRef<List<Manga>?>;

/// See also [categoryMangaList].
final categoryMangaListProvider = CategoryMangaListFamily();

class CategoryMangaListFamily extends Family<AsyncValue<List<Manga>?>> {
  CategoryMangaListFamily();

  CategoryMangaListProvider call(
    int categoryId,
  ) {
    return CategoryMangaListProvider(
      categoryId,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Manga>?> getProviderOverride(
    covariant CategoryMangaListProvider provider,
  ) {
    return call(
      provider.categoryId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'categoryMangaListProvider';
}
