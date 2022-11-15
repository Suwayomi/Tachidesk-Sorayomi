// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_repository.dart';

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

String $downloadsRepositoryHash() =>
    r'5863e339050a4025a026249d55ea40d25137c001';

/// See also [downloadsRepository].
final downloadsRepositoryProvider = AutoDisposeProvider<DownloadsRepository>(
  downloadsRepository,
  name: r'downloadsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $downloadsRepositoryHash,
);
typedef DownloadsRepositoryRef = AutoDisposeProviderRef<DownloadsRepository>;
String $downloadsMapHash() => r'3e020f4f7bb5647d18338d46708464292234b7f6';

/// See also [downloadsMap].
final downloadsMapProvider = AutoDisposeProvider<Map<int, DownloadsQueue>>(
  downloadsMap,
  name: r'downloadsMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $downloadsMapHash,
);
typedef DownloadsMapRef = AutoDisposeProviderRef<Map<int, DownloadsQueue>>;
String $downloadsFromIdHash() => r'da4ab5797ab7eeb647433cc50c56d2e8b827218b';

/// See also [downloadsFromId].
class DownloadsFromIdProvider extends AutoDisposeProvider<DownloadsQueue?> {
  DownloadsFromIdProvider(
    this.chapterId,
  ) : super(
          (ref) => downloadsFromId(
            ref,
            chapterId,
          ),
          from: downloadsFromIdProvider,
          name: r'downloadsFromIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $downloadsFromIdHash,
        );

  final int chapterId;

  @override
  bool operator ==(Object other) {
    return other is DownloadsFromIdProvider && other.chapterId == chapterId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapterId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef DownloadsFromIdRef = AutoDisposeProviderRef<DownloadsQueue?>;

/// See also [downloadsFromId].
final downloadsFromIdProvider = DownloadsFromIdFamily();

class DownloadsFromIdFamily extends Family<DownloadsQueue?> {
  DownloadsFromIdFamily();

  DownloadsFromIdProvider call(
    int chapterId,
  ) {
    return DownloadsFromIdProvider(
      chapterId,
    );
  }

  @override
  AutoDisposeProvider<DownloadsQueue?> getProviderOverride(
    covariant DownloadsFromIdProvider provider,
  ) {
    return call(
      provider.chapterId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'downloadsFromIdProvider';
}
