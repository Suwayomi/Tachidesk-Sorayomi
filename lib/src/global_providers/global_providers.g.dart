// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioClientKeyHash() => r'f8ac67719cc287981dabd817e2010e3b8650659a';

/// See also [dioClientKey].
@ProviderFor(dioClientKey)
final dioClientKeyProvider = AutoDisposeProvider<DioClient>.internal(
  dioClientKey,
  name: r'dioClientKeyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioClientKeyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioClientKeyRef = AutoDisposeProviderRef<DioClient>;
String _$sharedPreferencesHash() => r'dd034076f3a6cac11ba173b2ebd1bd0debcadd42';

/// See also [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider =
    AutoDisposeProvider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPreferencesRef = AutoDisposeProviderRef<SharedPreferences>;
String _$appDirectoryHash() => r'598612365ff87cbdf65761e923161467412ec463';

/// See also [appDirectory].
@ProviderFor(appDirectory)
final appDirectoryProvider = AutoDisposeProvider<Directory?>.internal(
  appDirectory,
  name: r'appDirectoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDirectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDirectoryRef = AutoDisposeProviderRef<Directory?>;
String _$hiveCacheStoreHash() => r'9b2759c40cc610a05bf24953b306f6dec44cb2e6';

/// See also [hiveCacheStore].
@ProviderFor(hiveCacheStore)
final hiveCacheStoreProvider = AutoDisposeProvider<HiveCacheStore>.internal(
  hiveCacheStore,
  name: r'hiveCacheStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hiveCacheStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HiveCacheStoreRef = AutoDisposeProviderRef<HiveCacheStore>;
String _$authTypeKeyHash() => r'8264b20583c2d0e3c9da5073ff1c13fda7e7fc34';

/// See also [AuthTypeKey].
@ProviderFor(AuthTypeKey)
final authTypeKeyProvider =
    AutoDisposeNotifierProvider<AuthTypeKey, AuthType?>.internal(
  AuthTypeKey.new,
  name: r'authTypeKeyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authTypeKeyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthTypeKey = AutoDisposeNotifier<AuthType?>;
String _$l10nHash() => r'6a874a9412c7619bba907eebafcb828e7de350cf';

/// See also [L10n].
@ProviderFor(L10n)
final l10nProvider = AutoDisposeNotifierProvider<L10n, Locale?>.internal(
  L10n.new,
  name: r'l10nProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$l10nHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$L10n = AutoDisposeNotifier<Locale?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
