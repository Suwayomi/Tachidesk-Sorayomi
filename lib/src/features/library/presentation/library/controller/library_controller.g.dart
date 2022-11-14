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
    r'f68914cbd18e05f3f94e26c7315a1db818ef840a';

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

String $FilterDownloadedHash() => r'6746dc38450d61520fd6ba6d1a48392ea80d5a41';

/// See also [FilterDownloaded].
final filterDownloadedProvider =
    AutoDisposeNotifierProvider<FilterDownloaded, bool?>(
  FilterDownloaded.new,
  name: r'filterDownloadedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $FilterDownloadedHash,
);
typedef FilterDownloadedRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$FilterDownloaded extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String $FilterUnreadHash() => r'fd37d4540467c289eba2a1656bf2907dd6d97178';

/// See also [FilterUnread].
final filterUnreadProvider = AutoDisposeNotifierProvider<FilterUnread, bool?>(
  FilterUnread.new,
  name: r'filterUnreadProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $FilterUnreadHash,
);
typedef FilterUnreadRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$FilterUnread extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String $FilterCompletedHash() => r'a75cb48401eb02e32a8c9a2b08708ba371ad6e5b';

/// See also [FilterCompleted].
final filterCompletedProvider =
    AutoDisposeNotifierProvider<FilterCompleted, bool?>(
  FilterCompleted.new,
  name: r'filterCompletedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $FilterCompletedHash,
);
typedef FilterCompletedRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$FilterCompleted extends AutoDisposeNotifier<bool?> {
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

String $categoryMangaListHash() => r'8226b6fd808d5d15887df7482e18a5f754f5357c';

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
