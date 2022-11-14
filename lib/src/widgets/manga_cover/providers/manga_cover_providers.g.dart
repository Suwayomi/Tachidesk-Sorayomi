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

String $DownloadedBadgeHash() => r'90c3591232373dd343de693f4673de70a1d746f7';

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

String $UnreadBadgeHash() => r'4f7a03f9337a779c37250f37abb75624ca17805c';

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
