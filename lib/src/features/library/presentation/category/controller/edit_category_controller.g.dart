// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_category_controller.dart';

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

String $CategoryControllerHash() => r'426547f28a180b241dbc6f34fe8596109ea22c23';

/// See also [CategoryController].
final categoryControllerProvider =
    AutoDisposeAsyncNotifierProvider<CategoryController, List<Category>?>(
  CategoryController.new,
  name: r'categoryControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $CategoryControllerHash,
);
typedef CategoryControllerRef
    = AutoDisposeAsyncNotifierProviderRef<List<Category>?>;

abstract class _$CategoryController
    extends AutoDisposeAsyncNotifier<List<Category>?> {
  @override
  FutureOr<List<Category>?> build();
}

String $categoryListHash() => r'0faadf4a144a14c5d06555a18aa2bb0c1f6feb76';

/// See also [categoryList].
class CategoryListProvider extends AutoDisposeProvider<List<Category>> {
  CategoryListProvider({
    this.getDefault = false,
  }) : super(
          (ref) => categoryList(
            ref,
            getDefault: getDefault,
          ),
          from: categoryListProvider,
          name: r'categoryListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $categoryListHash,
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

typedef CategoryListRef = AutoDisposeProviderRef<List<Category>>;

/// See also [categoryList].
final categoryListProvider = CategoryListFamily();

class CategoryListFamily extends Family<List<Category>> {
  CategoryListFamily();

  CategoryListProvider call({
    bool getDefault = false,
  }) {
    return CategoryListProvider(
      getDefault: getDefault,
    );
  }

  @override
  AutoDisposeProvider<List<Category>> getProviderOverride(
    covariant CategoryListProvider provider,
  ) {
    return call(
      getDefault: provider.getDefault,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'categoryListProvider';
}
