// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trackerListHash() => r'ec81f097bcd6e576afd2107dd6d7eb3bb6b0991a';

/// See also [trackerList].
@ProviderFor(trackerList)
final trackerListProvider = AutoDisposeFutureProvider<List<Tracker>?>.internal(
  trackerList,
  name: r'trackerListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$trackerListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TrackerListRef = AutoDisposeFutureProviderRef<List<Tracker>?>;
String _$trackSearchWithIdHash() => r'4baa081fc037fdd64707efa5fdead370bea83257';

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

/// See also [trackSearchWithId].
@ProviderFor(trackSearchWithId)
const trackSearchWithIdProvider = TrackSearchWithIdFamily();

/// See also [trackSearchWithId].
class TrackSearchWithIdFamily extends Family<AsyncValue<List<TrackSearch>?>> {
  /// See also [trackSearchWithId].
  const TrackSearchWithIdFamily();

  /// See also [trackSearchWithId].
  TrackSearchWithIdProvider call({
    required int trackerId,
  }) {
    return TrackSearchWithIdProvider(
      trackerId: trackerId,
    );
  }

  @override
  TrackSearchWithIdProvider getProviderOverride(
    covariant TrackSearchWithIdProvider provider,
  ) {
    return call(
      trackerId: provider.trackerId,
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
  String? get name => r'trackSearchWithIdProvider';
}

/// See also [trackSearchWithId].
class TrackSearchWithIdProvider
    extends AutoDisposeFutureProvider<List<TrackSearch>?> {
  /// See also [trackSearchWithId].
  TrackSearchWithIdProvider({
    required int trackerId,
  }) : this._internal(
          (ref) => trackSearchWithId(
            ref as TrackSearchWithIdRef,
            trackerId: trackerId,
          ),
          from: trackSearchWithIdProvider,
          name: r'trackSearchWithIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trackSearchWithIdHash,
          dependencies: TrackSearchWithIdFamily._dependencies,
          allTransitiveDependencies:
              TrackSearchWithIdFamily._allTransitiveDependencies,
          trackerId: trackerId,
        );

  TrackSearchWithIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.trackerId,
  }) : super.internal();

  final int trackerId;

  @override
  Override overrideWith(
    FutureOr<List<TrackSearch>?> Function(TrackSearchWithIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TrackSearchWithIdProvider._internal(
        (ref) => create(ref as TrackSearchWithIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        trackerId: trackerId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TrackSearch>?> createElement() {
    return _TrackSearchWithIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrackSearchWithIdProvider && other.trackerId == trackerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, trackerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TrackSearchWithIdRef on AutoDisposeFutureProviderRef<List<TrackSearch>?> {
  /// The parameter `trackerId` of this provider.
  int get trackerId;
}

class _TrackSearchWithIdProviderElement
    extends AutoDisposeFutureProviderElement<List<TrackSearch>?>
    with TrackSearchWithIdRef {
  _TrackSearchWithIdProviderElement(super.provider);

  @override
  int get trackerId => (origin as TrackSearchWithIdProvider).trackerId;
}

String _$trackSearchQueryHash() => r'37a934bd44b9c753ea9b9b5bc95623b5504e02a0';

/// See also [TrackSearchQuery].
@ProviderFor(TrackSearchQuery)
final trackSearchQueryProvider =
    AutoDisposeNotifierProvider<TrackSearchQuery, String>.internal(
  TrackSearchQuery.new,
  name: r'trackSearchQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trackSearchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TrackSearchQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
