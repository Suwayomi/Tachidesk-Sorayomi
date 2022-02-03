import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../core/constants/db_keys.dart';
import '../../../core/enums/reader_mode.dart';
import '../../../data/chapter_model.dart';
import '../../../data/manga_model.dart';
import '../../../data/repository/chapter_repository.dart';
import '../../../data/repository/manga_repository.dart';
import '../../../routes/app_pages.dart';

class ReaderController extends GetxController {
  late final int mangaId;
  late final int chapterIndex;

  final Rx<Manga> _manga = Manga().obs;
  Manga get manga => _manga.value;
  set manga(Manga value) => _manga.value = value;

  final Rx<Chapter> _chapter = Chapter().obs;
  Chapter get chapter => _chapter.value;
  set chapter(Chapter value) => _chapter.value = value;

  final MangaRepository mangaRepository = MangaRepository();
  final ChapterRepository chapterRepository = ChapterRepository();
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  final Rx<ReaderMode> readerMode = ReaderMode.webtoon.obs;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final RxBool _isDataLoading = false.obs;
  bool get isDataLoading => _isDataLoading.value;
  set isDataLoading(bool value) => _isDataLoading.value = value;

  final RxBool _visibility = false.obs;
  bool get visibility => _visibility.value;
  void toggleVisibility() => _visibility.value = !_visibility.value;

  final RxBool _expandedState = false.obs;
  bool get expandedState => _expandedState.value;
  set expandedState(bool value) => _expandedState.value = value;

  String getChapterPage(int page) => chapterRepository.getChapterPage(
      mangaId: mangaId, chapterIndex: chapterIndex, page: page);

  @override
  void onInit() {
    mangaId = int.parse(Get.parameters["mangaId"]!);
    chapterIndex = int.parse(Get.parameters["chapterIndex"]!);
    readerMode.value = localStorageService.readerMode;
    super.onInit();
  }

  void nextChapter() {
    if ((chapter.index ?? 1) < (chapter.chapterCount ?? 1)) {
      chapterRepository.patchChapter(chapter, {
        "lastPageRead": chapter.pageCount! - 1,
        "read": true,
      });
    }
    Get.offNamed(
        Routes.manga + "/${chapter.mangaId}/chapter/${chapter.index! + 1}");
  }

  Future markAsRead() async {
    Map<String, dynamic> formData = {"read": true, "lastPageRead": "1"};
    await chapterRepository.patchChapter(chapter, formData);
  }

  void prevChapter() {
    if ((chapter.index ?? 0) > 1) {
      Get.offNamed(
          Routes.manga + "/${chapter.mangaId}/chapter/${chapter.index! - 1}");
    }
  }

  @override
  void onReady() async {
    localStorageService.box.listenKey(
      readerModeKey,
      (value) =>
          readerMode.value = stringToReaderMode(value) ?? readerMode.value,
    );
    isLoading = true;
    chapter = (await chapterRepository.getChapter(
            mangaId: mangaId, chapterIndex: chapterIndex)) ??
        chapter;
    manga = (await mangaRepository.getManga(mangaId)) ?? manga;
    isDataLoading = true;
    isLoading = false;

    super.onReady();
  }

  @override
  void onClose() {}
}
