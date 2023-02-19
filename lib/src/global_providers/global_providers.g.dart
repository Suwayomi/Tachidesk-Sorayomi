// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authTypeKeyHash() => r'4ec3957b64a93c74d7034a0b4a05567fa59a212d';

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
String _$l10nHash() => r'8a8734741cebf400bc54f9be4365bef9b07da454';

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
String _$dioClientKeyHash() => r'aa6e40fe7fd11fd2fd884674cf4d47c1c5f93048';

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
