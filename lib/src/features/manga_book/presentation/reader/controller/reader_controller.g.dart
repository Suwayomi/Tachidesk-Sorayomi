// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chapterHash() => r'80779674a17d3466d24f1b08fc563a41c58f8070';

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

typedef ChapterRef = AutoDisposeFutureProviderRef<Chapter?>;

/// See also [chapter].
@ProviderFor(chapter)
const chapterProvider = ChapterFamily();

/// See also [chapter].
class ChapterFamily extends Family<AsyncValue<Chapter?>> {
  /// See also [chapter].
  const ChapterFamily();

  /// See also [chapter].
  ChapterProvider call({
    required String mangaId,
    required String chapterIndex,
  }) {
    return ChapterProvider(
      mangaId: mangaId,
      chapterIndex: chapterIndex,
    );
  }

  @override
  ChapterProvider getProviderOverride(
    covariant ChapterProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
      chapterIndex: provider.chapterIndex,
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
  String? get name => r'chapterProvider';
}

/// See also [chapter].
class ChapterProvider extends AutoDisposeFutureProvider<Chapter?> {
  /// See also [chapter].
  ChapterProvider({
    required this.mangaId,
    required this.chapterIndex,
  }) : super.internal(
          (ref) => chapter(
            ref,
            mangaId: mangaId,
            chapterIndex: chapterIndex,
          ),
          from: chapterProvider,
          name: r'chapterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chapterHash,
          dependencies: ChapterFamily._dependencies,
          allTransitiveDependencies: ChapterFamily._allTransitiveDependencies,
        );

  final String mangaId;
  final String chapterIndex;

  @override
  bool operator ==(Object other) {
    return other is ChapterProvider &&
        other.mangaId == mangaId &&
        other.chapterIndex == chapterIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);
    hash = _SystemHash.combine(hash, chapterIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
