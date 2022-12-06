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

String $CategoryMangaListWithQueryAndFilterHash() =>
    r'c2edbd4a27b545f55985a625ed5df2dabbaf6919';

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
    r'9434b5180757eb9fc2d7fa7e06e99bba44322511';

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
    r'a8d295082d2c44d2cf4e1134eb118d0aa32251ec';

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
    r'afb42c154948dcb2470572736aca977a758d3e6c';

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

String $LibraryMangaSortHash() => r'338b71fe5d5633805cd18f8e407d7aef7058dfac';

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
    r'bca0a42a66cb3284ef0d79f0748c63f6d57baa8f';

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

String $LibraryDisplayModeHash() => r'cd51333d8366181bd239a9512e0fb3fc80807402';

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
