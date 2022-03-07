import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../core/values/db_keys.dart';
import '../../../data/chapter_model.dart';
import '../../../data/enums/reader_mode.dart';
import '../../../data/manga_model.dart';
import '../../../routes/app_pages.dart';
import '../repository/reader_repository.dart';

class ReaderController extends GetxController {
  final ReaderRepository repository = ReaderRepository();
  late final int mangaId;
  late final int chapterIndex;

  final Rx<Manga> _manga = Manga().obs;
  Manga get manga => _manga.value;
  set manga(Manga value) => _manga.value = value;

  final Rx<Chapter> _chapter = Chapter().obs;
  Chapter get chapter => _chapter.value;
  set chapter(Chapter value) => _chapter.value = value;

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

  String getChapterPage(int page) => repository.getChapterPage(
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
      repository.patchChapter(chapter, {
        "lastPageRead": chapter.pageCount! - 1,
        "read": true,
      });
    }
    Get.offNamed(
        Routes.manga + "/${chapter.mangaId}/chapter/${chapter.index! + 1}");
  }

  Future<void> markAsRead() async {
    Map<String, dynamic> formData = {"read": true, "lastPageRead": "1"};
    await repository.patchChapter(chapter, formData);
  }

  void prevChapter() {
    if ((chapter.index ?? 0) > 1) {
      Get.offNamed(
          Routes.manga + "/${chapter.mangaId}/chapter/${chapter.index! - 1}");
    }
  }

  Future<void> reloadReader() async {
    isLoading = true;
    chapter = (await repository.getChapter(
            mangaId: mangaId, chapterIndex: chapterIndex)) ??
        chapter;
    manga = (await repository.getManga(mangaId)) ?? manga;
    isDataLoading = true;
    isLoading = false;
  }

  @override
  void onReady() async {
    localStorageService.box.listenKey(
      readerModeKey,
      (value) =>
          readerMode.value = stringToReaderMode(value) ?? readerMode.value,
    );
    await reloadReader();
    super.onReady();
  }

  @override
  void onClose() {}
}
