// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_providers.dart';

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

String $AuthTypeKeyHash() => r'4ec3957b64a93c74d7034a0b4a05567fa59a212d';

/// See also [AuthTypeKey].
final authTypeKeyProvider = AutoDisposeNotifierProvider<AuthTypeKey, AuthType?>(
  AuthTypeKey.new,
  name: r'authTypeKeyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $AuthTypeKeyHash,
);
typedef AuthTypeKeyRef = AutoDisposeNotifierProviderRef<AuthType?>;

abstract class _$AuthTypeKey extends AutoDisposeNotifier<AuthType?> {
  @override
  AuthType? build();
}

String $dioClientKeyHash() => r'aa6e40fe7fd11fd2fd884674cf4d47c1c5f93048';

/// See also [dioClientKey].
final dioClientKeyProvider = AutoDisposeProvider<DioClient>(
  dioClientKey,
  name: r'dioClientKeyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $dioClientKeyHash,
);
typedef DioClientKeyRef = AutoDisposeProviderRef<DioClient>;
