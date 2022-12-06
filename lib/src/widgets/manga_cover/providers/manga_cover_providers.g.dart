// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_cover_providers.dart';

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

String $DownloadedBadgeHash() => r'5ecc9b6c21dd534da7ec96ca39560c15b0766631';

/// See also [DownloadedBadge].
final downloadedBadgeProvider =
    AutoDisposeNotifierProvider<DownloadedBadge, bool?>(
  DownloadedBadge.new,
  name: r'downloadedBadgeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $DownloadedBadgeHash,
);
typedef DownloadedBadgeRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$DownloadedBadge extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String $UnreadBadgeHash() => r'2f9d995c4303eb3e873c03dfef8d454d5b4dcbe5';

/// See also [UnreadBadge].
final unreadBadgeProvider = AutoDisposeNotifierProvider<UnreadBadge, bool?>(
  UnreadBadge.new,
  name: r'unreadBadgeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $UnreadBadgeHash,
);
typedef UnreadBadgeRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$UnreadBadge extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}
