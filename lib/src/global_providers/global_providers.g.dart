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

String $AuthTypeKeyHash() => r'93f442ae501f4cc908e1bfdedac0986458c877de';

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

String $packageInfoHash() => r'a5025c8498b8f2eacf55450228619ff1477adc05';

/// See also [packageInfo].
final packageInfoProvider = AutoDisposeProvider<PackageInfo>(
  packageInfo,
  name: r'packageInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $packageInfoHash,
);
typedef PackageInfoRef = AutoDisposeProviderRef<PackageInfo>;
String $dioClientKeyHash() => r'aa6e40fe7fd11fd2fd884674cf4d47c1c5f93048';

/// See also [dioClientKey].
final dioClientKeyProvider = AutoDisposeProvider<DioClient>(
  dioClientKey,
  name: r'dioClientKeyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $dioClientKeyHash,
);
typedef DioClientKeyRef = AutoDisposeProviderRef<DioClient>;
