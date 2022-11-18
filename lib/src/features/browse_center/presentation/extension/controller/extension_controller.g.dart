// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_controller.dart';

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

String $ExtensionLanguageFilterHash() =>
    r'697f4467d0009bf6a257ef38da21e4dd4595d95a';

/// See also [ExtensionLanguageFilter].
final extensionLanguageFilterProvider =
    AutoDisposeNotifierProvider<ExtensionLanguageFilter, List<String>?>(
  ExtensionLanguageFilter.new,
  name: r'extensionLanguageFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $ExtensionLanguageFilterHash,
);
typedef ExtensionLanguageFilterRef
    = AutoDisposeNotifierProviderRef<List<String>?>;

abstract class _$ExtensionLanguageFilter
    extends AutoDisposeNotifier<List<String>?> {
  @override
  List<String>? build();
}

String $ExtensionQueryHash() => r'fbf22cd295f0065c5d9f0c591f87ff58272b7810';

/// See also [ExtensionQuery].
final extensionQueryProvider =
    AutoDisposeNotifierProvider<ExtensionQuery, String?>(
  ExtensionQuery.new,
  name: r'extensionQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $ExtensionQueryHash,
);
typedef ExtensionQueryRef = AutoDisposeNotifierProviderRef<String?>;

abstract class _$ExtensionQuery extends AutoDisposeNotifier<String?> {
  @override
  String? build();
}

String $extensionControllerHash() =>
    r'eebafdf1b7d7b9a4bf863a1c67ee20ff7d58735c';

/// See also [extensionController].
final extensionControllerProvider = AutoDisposeFutureProvider<List<Extension>?>(
  extensionController,
  name: r'extensionControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $extensionControllerHash,
);
typedef ExtensionControllerRef = AutoDisposeFutureProviderRef<List<Extension>?>;
String $extensionMapHash() => r'6fbdb022b32bf23b311927f419581dca0a4a081d';

/// See also [extensionMap].
final extensionMapProvider = AutoDisposeProvider<Map<String, List<Extension>>>(
  extensionMap,
  name: r'extensionMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $extensionMapHash,
);
typedef ExtensionMapRef = AutoDisposeProviderRef<Map<String, List<Extension>>>;
String $extensionMapFilteredHash() =>
    r'b1e7d1337be752221c174b718844827b6969acd2';

/// See also [extensionMapFiltered].
final extensionMapFilteredProvider =
    AutoDisposeProvider<Map<String, List<Extension>>>(
  extensionMapFiltered,
  name: r'extensionMapFilteredProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $extensionMapFilteredHash,
);
typedef ExtensionMapFilteredRef
    = AutoDisposeProviderRef<Map<String, List<Extension>>>;
String $extensionMapFilteredAndQueriedHash() =>
    r'5f9fd9b62badb7e86a29a590507864eb93448bcc';

/// See also [extensionMapFilteredAndQueried].
final extensionMapFilteredAndQueriedProvider =
    AutoDisposeProvider<Map<String, List<Extension>>>(
  extensionMapFilteredAndQueried,
  name: r'extensionMapFilteredAndQueriedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $extensionMapFilteredAndQueriedHash,
);
typedef ExtensionMapFilteredAndQueriedRef
    = AutoDisposeProviderRef<Map<String, List<Extension>>>;
