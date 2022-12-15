// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_controller.dart';

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

String $chapterHash() => r'80779674a17d3466d24f1b08fc563a41c58f8070';

/// See also [chapter].
class ChapterProvider extends AutoDisposeFutureProvider<Chapter?> {
  ChapterProvider({
    required this.mangaId,
    required this.chapterIndex,
  }) : super(
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
                  : $chapterHash,
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

typedef ChapterRef = AutoDisposeFutureProviderRef<Chapter?>;

/// See also [chapter].
final chapterProvider = ChapterFamily();

class ChapterFamily extends Family<AsyncValue<Chapter?>> {
  ChapterFamily();

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
  AutoDisposeFutureProvider<Chapter?> getProviderOverride(
    covariant ChapterProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
      chapterIndex: provider.chapterIndex,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'chapterProvider';
}
