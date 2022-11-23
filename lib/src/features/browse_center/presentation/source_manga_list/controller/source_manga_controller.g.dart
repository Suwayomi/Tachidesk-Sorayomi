// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_manga_controller.dart';

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

String $SourceDisplayModeHash() => r'71babad5dcc543acdba775ff479c545c58569ff1';

/// See also [SourceDisplayMode].
final sourceDisplayModeProvider =
    AutoDisposeNotifierProvider<SourceDisplayMode, DisplayMode?>(
  SourceDisplayMode.new,
  name: r'sourceDisplayModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $SourceDisplayModeHash,
);
typedef SourceDisplayModeRef = AutoDisposeNotifierProviderRef<DisplayMode?>;

abstract class _$SourceDisplayMode extends AutoDisposeNotifier<DisplayMode?> {
  @override
  DisplayMode? build();
}

String $sourceHash() => r'4b9780685f4d7657fd9d31eb5b535275b9896577';

/// See also [source].
class SourceProvider extends AutoDisposeFutureProvider<Source?> {
  SourceProvider(
    this.sourceId,
  ) : super(
          (ref) => source(
            ref,
            sourceId,
          ),
          from: sourceProvider,
          name: r'sourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $sourceHash,
        );

  final String sourceId;

  @override
  bool operator ==(Object other) {
    return other is SourceProvider && other.sourceId == sourceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sourceId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SourceRef = AutoDisposeFutureProviderRef<Source?>;

/// See also [source].
final sourceProvider = SourceFamily();

class SourceFamily extends Family<AsyncValue<Source?>> {
  SourceFamily();

  SourceProvider call(
    String sourceId,
  ) {
    return SourceProvider(
      sourceId,
    );
  }

  @override
  AutoDisposeFutureProvider<Source?> getProviderOverride(
    covariant SourceProvider provider,
  ) {
    return call(
      provider.sourceId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'sourceProvider';
}
