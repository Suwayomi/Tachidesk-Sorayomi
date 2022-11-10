// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_repository.dart';

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

String $chapterRepositoryHash() => r'8af24aaf784f47a368aa09e96ed45368b1e02443';

/// See also [chapterRepository].
final chapterRepositoryProvider = AutoDisposeProvider<ChapterRepository>(
  chapterRepository,
  name: r'chapterRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $chapterRepositoryHash,
);
typedef ChapterRepositoryRef = AutoDisposeProviderRef<ChapterRepository>;
String $downloadsMapHash() => r'98144ddd19156954a2f7e7ef927a49f12997ee6c';

/// See also [downloadsMap].
final downloadsMapProvider = AutoDisposeProvider<Map<String, DownloadsQueue>>(
  downloadsMap,
  name: r'downloadsMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $downloadsMapHash,
);
typedef DownloadsMapRef = AutoDisposeProviderRef<Map<String, DownloadsQueue>>;
String $downloadsFromIdHash() => r'8d8da4f4e662fdfb553162ed237ae1fcb30f4e58';

/// See also [downloadsFromId].
class DownloadsFromIdProvider extends AutoDisposeProvider<DownloadsQueue?> {
  DownloadsFromIdProvider(
    this.key,
  ) : super(
          (ref) => downloadsFromId(
            ref,
            key,
          ),
          from: downloadsFromIdProvider,
          name: r'downloadsFromIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $downloadsFromIdHash,
        );

  final String key;

  @override
  bool operator ==(Object other) {
    return other is DownloadsFromIdProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef DownloadsFromIdRef = AutoDisposeProviderRef<DownloadsQueue?>;

/// See also [downloadsFromId].
final downloadsFromIdProvider = DownloadsFromIdFamily();

class DownloadsFromIdFamily extends Family<DownloadsQueue?> {
  DownloadsFromIdFamily();

  DownloadsFromIdProvider call(
    String key,
  ) {
    return DownloadsFromIdProvider(
      key,
    );
  }

  @override
  AutoDisposeProvider<DownloadsQueue?> getProviderOverride(
    covariant DownloadsFromIdProvider provider,
  ) {
    return call(
      provider.key,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'downloadsFromIdProvider';
}
