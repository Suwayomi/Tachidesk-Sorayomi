// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_repository.dart';

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

String $categoryRepositoryHash() => r'f62ecef9ec108e4aba46068e319e118730be6d06';

/// See also [categoryRepository].
final categoryRepositoryProvider = AutoDisposeProvider<CategoryRepository>(
  categoryRepository,
  name: r'categoryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $categoryRepositoryHash,
);
typedef CategoryRepositoryRef = AutoDisposeProviderRef<CategoryRepository>;
String $categoryMangaListHash() => r'0e0342521704cbf34d286352c4bf3bbf56af4012';

/// See also [categoryMangaList].
class CategoryMangaListProvider
    extends AutoDisposeFutureProvider<List<Manga>?> {
  CategoryMangaListProvider({
    required this.categoryId,
  }) : super(
          (ref) => categoryMangaList(
            ref,
            categoryId: categoryId,
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

  CategoryMangaListProvider call({
    required int categoryId,
  }) {
    return CategoryMangaListProvider(
      categoryId: categoryId,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Manga>?> getProviderOverride(
    covariant CategoryMangaListProvider provider,
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
  String? get name => r'categoryMangaListProvider';
}
