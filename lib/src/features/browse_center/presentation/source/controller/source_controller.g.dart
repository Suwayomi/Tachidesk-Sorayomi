// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_controller.dart';

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

String _$SourceLanguageFilterHash() =>
    r'85534834566ef4108261b5fd629aa9129a6937b7';

/// See also [SourceLanguageFilter].
final sourceLanguageFilterProvider =
    AutoDisposeNotifierProvider<SourceLanguageFilter, List<String>?>(
  SourceLanguageFilter.new,
  name: r'sourceLanguageFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$SourceLanguageFilterHash,
);
typedef SourceLanguageFilterRef = AutoDisposeNotifierProviderRef<List<String>?>;

abstract class _$SourceLanguageFilter
    extends AutoDisposeNotifier<List<String>?> {
  @override
  List<String>? build();
}

String _$SourceLastUsedHash() => r'b8f039f84d5b077393b2646530f97db5085f2e05';

/// See also [SourceLastUsed].
final sourceLastUsedProvider =
    AutoDisposeNotifierProvider<SourceLastUsed, String?>(
  SourceLastUsed.new,
  name: r'sourceLastUsedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$SourceLastUsedHash,
);
typedef SourceLastUsedRef = AutoDisposeNotifierProviderRef<String?>;

abstract class _$SourceLastUsed extends AutoDisposeNotifier<String?> {
  @override
  String? build();
}

String _$sourceListHash() => r'80d37bd602ce3e229ac64c39743cee84d94fd1f9';

/// See also [sourceList].
final sourceListProvider = AutoDisposeFutureProvider<List<Source>?>(
  sourceList,
  name: r'sourceListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sourceListHash,
);
typedef SourceListRef = AutoDisposeFutureProviderRef<List<Source>?>;
String _$sourceMapHash() => r'13682cd8c100d4d7ef007793b2c5ab9f97bad438';

/// See also [sourceMap].
final sourceMapProvider =
    AutoDisposeProvider<AsyncValue<Map<String, List<Source>>>>(
  sourceMap,
  name: r'sourceMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sourceMapHash,
);
typedef SourceMapRef
    = AutoDisposeProviderRef<AsyncValue<Map<String, List<Source>>>>;
String _$sourceFilterLangListHash() =>
    r'939f87fc2d97aa5e148ebee43b6efe8b21bd8d39';

/// See also [sourceFilterLangList].
final sourceFilterLangListProvider = AutoDisposeProvider<List<String>>(
  sourceFilterLangList,
  name: r'sourceFilterLangListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sourceFilterLangListHash,
);
typedef SourceFilterLangListRef = AutoDisposeProviderRef<List<String>>;
String _$sourceMapFilteredHash() => r'61d31082533cfd32f73664fd5f16c5eba09c54b8';

/// See also [sourceMapFiltered].
final sourceMapFilteredProvider =
    AutoDisposeProvider<AsyncValue<Map<String, List<Source>>?>>(
  sourceMapFiltered,
  name: r'sourceMapFilteredProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sourceMapFilteredHash,
);
typedef SourceMapFilteredRef
    = AutoDisposeProviderRef<AsyncValue<Map<String, List<Source>>?>>;
