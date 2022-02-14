import 'package:get/get.dart';

import '../../../data/chapter_model.dart';
import '../../../data/downloads_model.dart';
import '../../../data/manga_model.dart';
import '../../../data/repository/chapter_repository.dart';
import '../../../data/repository/download_queue_value_repository.dart';
import '../../../data/repository/downloads_repository.dart';
import '../../../data/repository/manga_repository.dart';
import '../../library/controllers/library_controller.dart';

class MangaController extends GetxController {
  final Rx<Manga> manga = Manga().obs;
  late int id;
  final RxBool isLoading = false.obs;
  final RxBool isPageLoading = false.obs;
  final RxList<Chapter?> _chapterList = <Chapter?>[].obs;

  List<Chapter?> get chapterList => _chapterList;
  set chapterList(List<Chapter?> value) => _chapterList.value = value;
  void chapterListRefresh() => _chapterList.refresh();

  final Rx<Chapter> _firstUnreadChapter = Chapter(index: -1).obs;
  Chapter get firstUnreadChapter => _firstUnreadChapter.value;
  set firstUnreadChapter(Chapter value) => _firstUnreadChapter.value = value;

  late final GetSocket downloadSocket;
  final Rx<Downloads> _downloadsList = Downloads(queue: []).obs;

  Rx<Downloads> get downloadsListObs => _downloadsList;
  Downloads get downloadsList => _downloadsList.value;
  set downloadsList(Downloads value) => _downloadsList.value = value;

  Future<void> loadManga() async {
    manga.value = await MangaRepository.getManga(id,
            fetchFreshData: !(manga.value.freshData ?? true)) ??
        manga.value;
  }

  Future<void> removeMangaFromLibrary() async {
    await MangaRepository.removeMangaFromLibrary(id);
    loadManga();
    try {
      await Get.find<LibraryController>().loadMangaListWithCategoryId();
    } catch (e) {
      /**/
    }
  }

  Future<void> addMangaToLibrary() async {
    await MangaRepository.addMangaToLibrary(id);
    loadManga();
    try {
      await Get.find<LibraryController>().loadMangaListWithCategoryId();
    } catch (e) {
      /**/
    }
  }

  void getFirstUnreadChapter() {
    List<Chapter?> chapterLst = _chapterList.reversed.toList();
    firstUnreadChapter = chapterLst.firstWhereOrNull(
            (element) => ((element?.read ?? true) == false)) ??
        firstUnreadChapter;
  }

  Future<void> loadChapterList(
      {bool loadingWidget = true, bool onlineFetch = false}) async {
    if (loadingWidget) {
      isLoading.value = true;
      chapterList = (await ChapterRepository.getChaptersList(id,
              onlineFetch: onlineFetch)) ??
          chapterList;
      isLoading.value = false;
    } else {
      chapterList = (await ChapterRepository.getChaptersList(id,
              onlineFetch: onlineFetch)) ??
          chapterList;
    }
    getFirstUnreadChapter();
  }

  Future modifyChapter(Chapter chapter, String key, dynamic value) async {
    Map<String, dynamic> formData = {key: value};
    if (key == "read") formData['lastPageRead'] = '1';
    await ChapterRepository.patchChapter(chapter, formData);
    await loadChapterList(loadingWidget: false);
  }

  Future startDownload(Chapter chapter) =>
      DownloadQueueValueRepository.startDownload(chapter);

  Future deleteDownload(Chapter chapter) =>
      DownloadQueueValueRepository.deleteDownload(chapter);
  Future deleteFromDownloadQueue(Chapter chapter) =>
      DownloadQueueValueRepository.deleteFromDownloadQueue(chapter);

  @override
  void onInit() {
    id = int.parse(Get.parameters["mangaId"]!);
    downloadSocket = DownloadsRepository.socketDownloads();
    super.onInit();
  }

  @override
  void onReady() async {
    isPageLoading.value = true;
    await loadManga();
    isPageLoading.value = false;
    await loadChapterList();
    downloadSocket.onMessage((val) {
      downloadsList = Downloads.fromJson(val);
    });
    super.onReady();
  }

  @override
  void onClose() {}
}
