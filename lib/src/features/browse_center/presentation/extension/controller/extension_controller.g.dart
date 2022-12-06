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
    r'a7719bb989b3042dd4b7a0b22ddc2042f5e34bc6';

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

String $extensionHash() => r'7f4a60c97e38a62db718b504d572bd031b5b845d';

/// See also [extension].
final extensionProvider = AutoDisposeFutureProvider<List<Extension>?>(
  extension,
  name: r'extensionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $extensionHash,
);
typedef ExtensionRef = AutoDisposeFutureProviderRef<List<Extension>?>;
String $extensionMapHash() => r'0a012417eeb39b5366182099e88cf9a614c5002c';

/// See also [extensionMap].
final extensionMapProvider =
    AutoDisposeProvider<AsyncValue<Map<String, List<Extension>>>>(
  extensionMap,
  name: r'extensionMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $extensionMapHash,
);
typedef ExtensionMapRef
    = AutoDisposeProviderRef<AsyncValue<Map<String, List<Extension>>>>;
String $extensionFilterLangListHash() =>
    r'86c8b07116486c19f0ac21976ce798304bb7f2ee';

/// See also [extensionFilterLangList].
final extensionFilterLangListProvider = AutoDisposeProvider<List<String>>(
  extensionFilterLangList,
  name: r'extensionFilterLangListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $extensionFilterLangListHash,
);
typedef ExtensionFilterLangListRef = AutoDisposeProviderRef<List<String>>;
String $extensionMapFilteredHash() =>
    r'bcfe4ed3d11f2987273f35b672a3a27d9156fe77';

/// See also [extensionMapFiltered].
final extensionMapFilteredProvider =
    AutoDisposeProvider<AsyncValue<Map<String, List<Extension>>>>(
  extensionMapFiltered,
  name: r'extensionMapFilteredProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $extensionMapFilteredHash,
);
typedef ExtensionMapFilteredRef
    = AutoDisposeProviderRef<AsyncValue<Map<String, List<Extension>>>>;
String $extensionMapFilteredAndQueriedHash() =>
    r'211f3d7c994d5a1c7d9f4b1aba3437162cc69521';

/// See also [extensionMapFilteredAndQueried].
final extensionMapFilteredAndQueriedProvider =
    AutoDisposeProvider<AsyncValue<Map<String, List<Extension>>>>(
  extensionMapFilteredAndQueried,
  name: r'extensionMapFilteredAndQueriedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $extensionMapFilteredAndQueriedHash,
);
typedef ExtensionMapFilteredAndQueriedRef
    = AutoDisposeProviderRef<AsyncValue<Map<String, List<Extension>>>>;
