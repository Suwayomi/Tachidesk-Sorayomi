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

String $SourceLanguageFilterHash() =>
    r'd1d7c5ef725bee1c1f7c6850775f3879105e11dd';

/// See also [SourceLanguageFilter].
final sourceLanguageFilterProvider =
    AutoDisposeNotifierProvider<SourceLanguageFilter, List<String>?>(
  SourceLanguageFilter.new,
  name: r'sourceLanguageFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $SourceLanguageFilterHash,
);
typedef SourceLanguageFilterRef = AutoDisposeNotifierProviderRef<List<String>?>;

abstract class _$SourceLanguageFilter
    extends AutoDisposeNotifier<List<String>?> {
  @override
  List<String>? build();
}

String $SourceLastUsedHash() => r'fe4a01424bc1829604ac51cb9fbbe38f53136642';

/// See also [SourceLastUsed].
final sourceLastUsedProvider =
    AutoDisposeNotifierProvider<SourceLastUsed, String?>(
  SourceLastUsed.new,
  name: r'sourceLastUsedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $SourceLastUsedHash,
);
typedef SourceLastUsedRef = AutoDisposeNotifierProviderRef<String?>;

abstract class _$SourceLastUsed extends AutoDisposeNotifier<String?> {
  @override
  String? build();
}

String $sourceControllerHash() => r'a630f834c9166f8cb61cb6d3a29ff481b13a9c72';

/// See also [sourceController].
final sourceControllerProvider = AutoDisposeFutureProvider<List<Source>?>(
  sourceController,
  name: r'sourceControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $sourceControllerHash,
);
typedef SourceControllerRef = AutoDisposeFutureProviderRef<List<Source>?>;
String $sourceMapHash() => r'fdde6e97fc37a7473905f604c7c686610ab02357';

/// See also [sourceMap].
final sourceMapProvider = AutoDisposeProvider<Map<String, List<Source>>>(
  sourceMap,
  name: r'sourceMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $sourceMapHash,
);
typedef SourceMapRef = AutoDisposeProviderRef<Map<String, List<Source>>>;
String $sourceMapFilteredHash() => r'1351e1af28161f70953bb3dc6ed753b4e2fbd9d9';

/// See also [sourceMapFiltered].
final sourceMapFilteredProvider =
    AutoDisposeProvider<Map<String, List<Source>>>(
  sourceMapFiltered,
  name: r'sourceMapFilteredProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $sourceMapFilteredHash,
);
typedef SourceMapFilteredRef
    = AutoDisposeProviderRef<Map<String, List<Source>>>;
