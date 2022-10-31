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

String $CategoryControllerHash() => r'e6f7a84b67857766117c63dab405aead6edad0b5';

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

String $categoryListHash() => r'07f34dd63a89ee437f686e7c4e38e31c8d4af49f';

/// See also [categoryList].
final categoryListProvider = AutoDisposeProvider<List<Category>>(
  categoryList,
  name: r'categoryListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $categoryListHash,
);
typedef CategoryListRef = AutoDisposeProviderRef<List<Category>>;
