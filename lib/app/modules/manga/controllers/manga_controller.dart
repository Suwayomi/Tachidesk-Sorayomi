import 'package:get/get.dart';

import '../../../data/category_model.dart';
import '../../../data/chapter_model.dart';
import '../../../data/downloads_model.dart';
import '../../../data/manga_model.dart';
import '../../library/controllers/library_controller.dart';
import '../repository/manga_repository.dart';

class MangaController extends GetxController {
  final MangaRepository repository = MangaRepository();
  final Rx<Manga> manga = Manga().obs;
  late int id;
  final RxBool isLoading = false.obs;
  final RxBool isPageLoading = false.obs;
  final RxList<Chapter?> _chapterList = <Chapter?>[].obs;

  final RxList<Category> _categoryList = <Category>[].obs;
  set categoryList(List<Category> value) => _categoryList.value = value;
  List<Category> get categoryList => _categoryList;

  final RxList<Category> _mangaCategoryList = <Category>[].obs;
  set mangaCategoryList(List<Category> value) =>
      _mangaCategoryList.value = value;
  List<Category> get mangaCategoryList => _mangaCategoryList;

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
    manga.value = await repository.getManga(id,
            fetchFreshData: !(manga.value.freshData ?? true)) ??
        manga.value;
  }

  Future<void> removeMangaFromLibrary() async {
    await repository.removeMangaFromLibrary(id);
    loadManga();
    try {
      await Get.find<LibraryController>().loadMangaListWithCategoryId();
    } catch (e) {
      /**/
    }
  }

  Future<void> addMangaToLibrary() async {
    await repository.addMangaToLibrary(id);
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
      chapterList =
          (await repository.getChaptersList(id, onlineFetch: onlineFetch)) ??
              chapterList;
      isLoading.value = false;
    } else {
      chapterList =
          (await repository.getChaptersList(id, onlineFetch: onlineFetch)) ??
              chapterList;
    }
    getFirstUnreadChapter();
  }

  Future<void> modifyChapter(Chapter chapter, String key, dynamic value) async {
    Map<String, dynamic> formData = {key: value};
    if (key == "read") formData['lastPageRead'] = '1';
    await repository.patchChapter(chapter, formData);
    await loadChapterList(loadingWidget: false);
  }

  Future<void> startDownload(Chapter chapter) =>
      repository.startDownload(chapter);

  Future<void> deleteDownload(Chapter chapter) =>
      repository.deleteChapter(chapter);
  Future<void> deleteFromDownloadQueue(Chapter chapter) =>
      repository.deleteFromDownloadQueue(chapter);

  Future<void> loadCategoryList() async {
    List<Category> categoryListTemp = (await repository.getCategoryList());
    if (categoryListTemp.isNotEmpty) {
      categoryListTemp.removeAt(0);
    }
    categoryList = categoryListTemp;
    mangaCategoryList =
        await repository.getMangaCategoryList(manga.value.id!) ??
            mangaCategoryList;
  }

  @override
  void onInit() {
    id = int.parse(Get.parameters["mangaId"]!);
    downloadSocket = repository.socketDownloads();
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
