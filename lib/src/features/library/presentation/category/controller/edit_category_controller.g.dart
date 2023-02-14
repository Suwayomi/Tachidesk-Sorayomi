// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryControllerHash() =>
    r'2231c7c5b8ea2d7ebf9726d6f8cc63ecf7498fbb';

/// See also [CategoryController].
@ProviderFor(CategoryController)
final categoryControllerProvider = AutoDisposeAsyncNotifierProvider<
    CategoryController, List<Category>?>.internal(
  CategoryController.new,
  name: r'categoryControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryController = AutoDisposeAsyncNotifier<List<Category>?>;
String _$categoryListHash() => r'ec95a714a5556e167c3746d05151c0fe2a55a711';

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

typedef CategoryListRef = AutoDisposeProviderRef<AsyncValue<List<Category>>>;

/// See also [categoryList].
@ProviderFor(categoryList)
const categoryListProvider = CategoryListFamily();

/// See also [categoryList].
class CategoryListFamily extends Family<AsyncValue<List<Category>>> {
  /// See also [categoryList].
  const CategoryListFamily();

  /// See also [categoryList].
  CategoryListProvider call({
    bool getDefault = false,
  }) {
    return CategoryListProvider(
      getDefault: getDefault,
    );
  }

  @override
  CategoryListProvider getProviderOverride(
    covariant CategoryListProvider provider,
  ) {
    return call(
      getDefault: provider.getDefault,
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
  String? get name => r'categoryListProvider';
}

/// See also [categoryList].
class CategoryListProvider
    extends AutoDisposeProvider<AsyncValue<List<Category>>> {
  /// See also [categoryList].
  CategoryListProvider({
    this.getDefault = false,
  }) : super.internal(
          (ref) => categoryList(
            ref,
            getDefault: getDefault,
          ),
          from: categoryListProvider,
          name: r'categoryListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryListHash,
          dependencies: CategoryListFamily._dependencies,
          allTransitiveDependencies:
              CategoryListFamily._allTransitiveDependencies,
        );

  final bool getDefault;

  @override
  bool operator ==(Object other) {
    return other is CategoryListProvider && other.getDefault == getDefault;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, getDefault.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
