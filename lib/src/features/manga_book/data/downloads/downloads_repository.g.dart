// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$downloadsRepositoryHash() =>
    r'5863e339050a4025a026249d55ea40d25137c001';

/// See also [downloadsRepository].
@ProviderFor(downloadsRepository)
final downloadsRepositoryProvider =
    AutoDisposeProvider<DownloadsRepository>.internal(
  downloadsRepository,
  name: r'downloadsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$downloadsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DownloadsRepositoryRef = AutoDisposeProviderRef<DownloadsRepository>;
String _$downloadsMapHash() => r'069e7137bb59b01aea1cc49d4605e4b8c8a9d7fd';

/// See also [downloadsMap].
@ProviderFor(downloadsMap)
final downloadsMapProvider =
    AutoDisposeProvider<Map<int, DownloadsQueue>>.internal(
  downloadsMap,
  name: r'downloadsMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$downloadsMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DownloadsMapRef = AutoDisposeProviderRef<Map<int, DownloadsQueue>>;
String _$downloadsFromIdHash() => r'da4ab5797ab7eeb647433cc50c56d2e8b827218b';

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

/// See also [downloadsFromId].
@ProviderFor(downloadsFromId)
const downloadsFromIdProvider = DownloadsFromIdFamily();

/// See also [downloadsFromId].
class DownloadsFromIdFamily extends Family<DownloadsQueue?> {
  /// See also [downloadsFromId].
  const DownloadsFromIdFamily();

  /// See also [downloadsFromId].
  DownloadsFromIdProvider call(
    int chapterId,
  ) {
    return DownloadsFromIdProvider(
      chapterId,
    );
  }

  @override
  DownloadsFromIdProvider getProviderOverride(
    covariant DownloadsFromIdProvider provider,
  ) {
    return call(
      provider.chapterId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'downloadsFromIdProvider';
}

/// See also [downloadsFromId].
class DownloadsFromIdProvider extends AutoDisposeProvider<DownloadsQueue?> {
  /// See also [downloadsFromId].
  DownloadsFromIdProvider(
    int chapterId,
  ) : this._internal(
          (ref) => downloadsFromId(
            ref as DownloadsFromIdRef,
            chapterId,
          ),
          from: downloadsFromIdProvider,
          name: r'downloadsFromIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$downloadsFromIdHash,
          dependencies: DownloadsFromIdFamily._dependencies,
          allTransitiveDependencies:
              DownloadsFromIdFamily._allTransitiveDependencies,
          chapterId: chapterId,
        );

  DownloadsFromIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chapterId,
  }) : super.internal();

  final int chapterId;

  @override
  Override overrideWith(
    DownloadsQueue? Function(DownloadsFromIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DownloadsFromIdProvider._internal(
        (ref) => create(ref as DownloadsFromIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chapterId: chapterId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<DownloadsQueue?> createElement() {
    return _DownloadsFromIdProviderElement(this);
  }

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

mixin DownloadsFromIdRef on AutoDisposeProviderRef<DownloadsQueue?> {
  /// The parameter `chapterId` of this provider.
  int get chapterId;
}

class _DownloadsFromIdProviderElement
    extends AutoDisposeProviderElement<DownloadsQueue?>
    with DownloadsFromIdRef {
  _DownloadsFromIdProviderElement(super.provider);

  @override
  int get chapterId => (origin as DownloadsFromIdProvider).chapterId;
}

String _$downloadsSocketHash() => r'0fffb672640ebb3ba41893c1f362e7479f391471';

/// See also [DownloadsSocket].
@ProviderFor(DownloadsSocket)
final downloadsSocketProvider =
    AutoDisposeStreamNotifierProvider<DownloadsSocket, Downloads>.internal(
  DownloadsSocket.new,
  name: r'downloadsSocketProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$downloadsSocketHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DownloadsSocket = AutoDisposeStreamNotifier<Downloads>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
