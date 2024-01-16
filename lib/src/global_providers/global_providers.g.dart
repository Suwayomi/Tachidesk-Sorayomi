// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioClientKeyHash() => r'3c0bdf6561be103898cbba24855ca355c5dfba6b';

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
String _$rateLimitQueueHash() => r'87eb09e4f32c2b26762db986f09e7788a4fd52bb';

/// See also [rateLimitQueue].
@ProviderFor(rateLimitQueue)
final rateLimitQueueProvider = AutoDisposeProvider<Queue>.internal(
  rateLimitQueue,
  name: r'rateLimitQueueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rateLimitQueueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RateLimitQueueRef = AutoDisposeProviderRef<Queue>;
String _$authTypeKeyHash() => r'357e6f44cc8ac94656f8491ed9f6d1775ac52ec6';

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
String _$l10nHash() => r'1d15ba851371130f70b37ec77cbdc62ac6d9a7b8';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
