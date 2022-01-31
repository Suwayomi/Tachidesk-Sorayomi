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
  final RxList<Chapter?> chapterList = <Chapter?>[].obs;
  final MangaRepository mangaRepository = MangaRepository();
  final ChapterRepository chapterRepository = ChapterRepository();
  late int id;
  final RxBool isLoading = false.obs;
  final RxBool isPageLoading = false.obs;

  final Rx<Chapter> _firstUnreadChapter = Chapter(index: -1).obs;
  Chapter get firstUnreadChapter => _firstUnreadChapter.value;
  set firstUnreadChapter(Chapter value) => _firstUnreadChapter.value = value;

  final DownloadQueueValueRepository downloadQueueValueRepository =
      DownloadQueueValueRepository();

  final DownloadsRepository downloadsRepository = DownloadsRepository();
  late final GetSocket downloadSocket;
  final Rx<Downloads> _downloadsList = Downloads(queue: []).obs;

  Rx<Downloads> get downloadsListObs => _downloadsList;
  Downloads get downloadsList => _downloadsList.value;
  set downloadsList(Downloads value) => _downloadsList.value = value;

  Future<void> loadManga() async {
    manga.value = await mangaRepository.getManga(id,
            fetchFreshData: manga.value.freshData == null ||
                !(manga.value.freshData ?? false)) ??
        manga.value;
  }

  Future<void> removeMangaFromLibrary() async {
    await mangaRepository.removeMangaFromLibrary(id);
    loadManga();
    try {
      await Get.find<LibraryController>().loadMangaListWithCategoryId();
    } catch (e) {
      /**/
    }
  }

  Future<void> addMangaToLibrary() async {
    await mangaRepository.addMangaToLibrary(id);
    loadManga();
    try {
      await Get.find<LibraryController>().loadMangaListWithCategoryId();
    } catch (e) {
      /**/
    }
  }

  void getFirstUnreadChapter() {
    List<Chapter?> chapterLst = chapterList.value.reversed.toList();
    firstUnreadChapter = chapterLst.firstWhereOrNull(
            (element) => ((element?.read ?? true) == false)) ??
        firstUnreadChapter;
  }

  Future<void> loadChapterList({bool loadingWidget = true}) async {
    if (loadingWidget) {
      isLoading.value = true;
      chapterList.value = await chapterRepository.getChaptersList(id);
      isLoading.value = false;
    } else {
      chapterList.value = await chapterRepository.getChaptersList(id);
    }
    getFirstUnreadChapter();
  }

  Future modifyChapter(Chapter chapter, String key, dynamic value) async {
    Map<String, dynamic> formData = {key: value};
    if (key == "read") formData['lastPageRead'] = '1';
    await chapterRepository.patchChapter(chapter, formData);
    await loadChapterList(loadingWidget: false);
  }

  Future startDownload(Chapter chapter) =>
      downloadQueueValueRepository.startDownload(chapter);

  Future deleteDownload(Chapter chapter) =>
      downloadQueueValueRepository.deleteDownload(chapter);
  Future deleteFromDownloadQueue(Chapter chapter) =>
      downloadQueueValueRepository.deleteFromDownloadQueue(chapter);

  @override
  void onInit() {
    id = int.parse(Get.parameters["mangaId"]!);
    downloadSocket = downloadsRepository.socketDownloads();
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
