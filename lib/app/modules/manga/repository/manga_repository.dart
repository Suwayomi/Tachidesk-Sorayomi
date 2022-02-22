import 'package:get/get.dart';

import '../../../data/category_model.dart';
import '../../../data/chapter_model.dart';
import '../../../data/manga_model.dart';
import '../../../data/providers/category_provider.dart';
import '../../../data/providers/chapter_provider.dart';
import '../../../data/providers/download_queue_value_provider.dart';
import '../../../data/providers/downloads_provider.dart';
import '../../../data/providers/manga_provider.dart';

class MangaRepository {
  final ChapterProvider _chapterProvider = Get.put(ChapterProvider());
  final DownloadQueueValueProvider _downloadQueueValueProvider =
      Get.put(DownloadQueueValueProvider());
  final DownloadsProvider _downloadsProvider = Get.put(DownloadsProvider());
  final MangaProvider _mangaProvider = Get.put(MangaProvider());
  final CategoryProvider _categoryProvider = Get.put(CategoryProvider());

  // ChapterProvider

  Future<List<Chapter>?> getChaptersList(int mangaId,
      {bool onlineFetch = false}) {
    return _chapterProvider.getChaptersList(mangaId, onlineFetch: onlineFetch);
  }

  Future<Response> patchChapter(
      Chapter chapter, Map<String, dynamic> formData) {
    return _chapterProvider.patchChapter(
      chapter.mangaId!,
      chapter.index!,
      formData,
    );
  }

  Future<Response> deleteChapter(Chapter chapter) {
    return _chapterProvider.deletedownloadedChapter(
      mangaId: chapter.mangaId!,
      chapterIndex: chapter.index!,
    );
  }

  // MangaProvider

  Future<Manga?> getManga(int id, {bool fetchFreshData = true}) =>
      _mangaProvider.getManga(id, fetchFreshData: fetchFreshData);

  Future<Response> addMangaToLibrary(int id) =>
      _mangaProvider.addMangaToLibrary(id);

  Future<Response> removeMangaFromLibrary(int id) =>
      _mangaProvider.removeMangaFromLibrary(id);

  Future<Response> addMangaToCategory(int mangaId, int categoryId) =>
      _mangaProvider.addMangaToCategory(mangaId, categoryId);

  Future<Response> removeMangaFromCategory(int mangaId, int categoryId) =>
      _mangaProvider.removeMangaFromCategory(mangaId, categoryId);

  Future<List<Category>?> getMangaCategoryList(int id) =>
      _mangaProvider.getMangaCategoryList(id);

  // DownloadQueueValueProvider

  Future<Response> startDownload(Chapter chapter) =>
      _downloadQueueValueProvider.startDownload(
        mangaId: chapter.mangaId!,
        chapterIndex: chapter.index!,
      );

  Future<Response> deleteFromDownloadQueue(Chapter chapter) =>
      _downloadQueueValueProvider.deleteFromDownloadQueue(
        mangaId: chapter.mangaId!,
        chapterIndex: chapter.index!,
      );

  // DownloadsProvider

  GetSocket socketDownloads() => _downloadsProvider.socketDownloads();

  // categoryprovider

  Future<List<Category>> getCategoryList() =>
      _categoryProvider.getCategoryList();
}
