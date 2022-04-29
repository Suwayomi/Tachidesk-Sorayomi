import 'dart:convert';

import 'package:get/get.dart';

import '../../../core/utils/chapter/apply_chapter_filter.dart';
import '../../../core/utils/chapter/apply_chapter_sort.dart';
import '../../../core/utils/check_if_json.dart';
import '../../../core/values/db_keys.dart';
import '../../../data/category_model.dart';
import '../../../data/chapter_model.dart';
import '../../../data/downloads_model.dart';
import '../../../data/enums/chapter/chapter_filter.dart';
import '../../../data/enums/chapter/chapter_sort.dart';
import '../../../data/manga_model.dart';
import '../../../data/services/local_storage_service.dart';
import '../../library/controllers/library_controller.dart';
import '../repository/manga_repository.dart';

class MangaController extends GetxController {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();
  final MangaRepository repository = MangaRepository();
  final Rx<Manga> manga = Manga().obs;
  late int id;
  final RxBool isLoading = false.obs;
  final RxBool isPageLoading = false.obs;

  final RxList<Chapter?> _chapterList = <Chapter?>[].obs;
  List<Chapter?> chapterListCopy = <Chapter?>[];
  List<Chapter?> get chapterList => _chapterList;
  set chapterList(List<Chapter?> value) => _chapterList.value = value;
  void chapterListRefresh() => _chapterList.refresh();

  final RxList<Category> _categoryList = <Category>[].obs;
  set categoryList(List<Category> value) => _categoryList.value = value;
  List<Category> get categoryList => _categoryList;

  final RxList<Category> _mangaCategoryList = <Category>[].obs;
  set mangaCategoryList(List<Category> value) =>
      _mangaCategoryList.value = value;
  List<Category> get mangaCategoryList => _mangaCategoryList;

  final Rx<Chapter> _firstUnreadChapter = Chapter(index: -1).obs;
  Chapter get firstUnreadChapter => _firstUnreadChapter.value;
  set firstUnreadChapter(Chapter value) => _firstUnreadChapter.value = value;

  late final GetSocket downloadSocket;
  final Rx<Downloads> _downloadsList = Downloads(queue: []).obs;

  Rx<Downloads> get downloadsListObs => _downloadsList;
  Downloads get downloadsList => _downloadsList.value;
  set downloadsList(Downloads value) => _downloadsList.value = value;

  final RxMap<ChapterFilter, bool?> _chapterFilter = <ChapterFilter, bool?>{
    for (var element in ChapterFilter.values) element: null
  }.obs;
  Map<ChapterFilter, bool?> get chapterFilter => _chapterFilter;
  set chapterFilter(Map<ChapterFilter, bool?> value) =>
      _chapterFilter.value = value;

  final Rx<MapEntry<ChapterSort, bool>> _chapterSort =
      MapEntry(ChapterSort.fetchedAt, true).obs;
  MapEntry<ChapterSort, bool> get chapterSort => _chapterSort.value;
  set chapterSort(MapEntry<ChapterSort, bool> value) =>
      _chapterSort.value = value;

  Future<void> loadManga() async {
    manga.value = await repository.getManga(id,
            fetchFreshData: !(manga.value.freshData ?? true)) ??
        manga.value;

    if (manga.value.meta?[chapterFilterKey] != null) {
      chapterFilter = jsonDecode(manga.value.meta?[chapterFilterKey])
          .map<ChapterFilter, bool?>((String key, dynamic value) => MapEntry(
                chapterFilterFromString(key),
                value as bool?,
              ));
    }
    Map? map = manga.value.meta?[chapterSortKey] != null
        ? jsonDecode(manga.value.meta?[chapterSortKey])
        : null;
    if (map != null) {
      chapterSort =
          MapEntry(chapterSortfromString(map["key"]), map["value"] as bool);
    }
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
      chapterListCopy =
          (await repository.getChaptersList(id, onlineFetch: onlineFetch)) ??
              chapterListCopy;
      isLoading.value = false;
    } else {
      chapterListCopy =
          (await repository.getChaptersList(id, onlineFetch: onlineFetch)) ??
              chapterListCopy;
    }
    applyFilter();
    getFirstUnreadChapter();
  }

  void applyFilter() {
    chapterList = chapterListCopy
        .where(
          (element) => element != null
              ? applyChapterFilter(chapterFilter, element)
              : false,
        )
        .toList()
      ..sort((a, b) {
        if (a == null || b == null) return 0;
        return applyChapterSort(chapterSort, a, b);
      });
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
    if (categoryListTemp.isNotEmpty && categoryListTemp.first.id == 0) {
      categoryListTemp.removeAt(0);
    }
    categoryList = categoryListTemp;
    var mangaCatListTemp =
        await repository.getMangaCategoryList(manga.value.id!);
    if (mangaCatListTemp != null) mangaCategoryList = mangaCatListTemp;
  }

  Future<void> setMangaFilterAsDefault() async {
    await _localStorageService.setChapterSort(chapterSort);
    await _localStorageService.setChapterFilter(chapterFilter);
  }

  @override
  void onInit() {
    id = int.parse(Get.parameters["mangaId"]!);
    downloadSocket = repository.socketDownloads();
    super.onInit();
  }

  @override
  void onReady() async {
    chapterFilter = _localStorageService.chapterFilter;
    chapterSort = _localStorageService.chapterSort;
    _chapterFilter.listen((val) async {
      applyFilter();
      await repository.patchMangaMeta(
          manga.value,
          MapEntry(
            chapterFilterKey,
            jsonEncode(val.map<String, bool?>(
              (key, value) => MapEntry(key.name, value),
            )),
          ));
    });
    _chapterSort.listen((val) async {
      applyFilter();
      await repository.patchMangaMeta(
        manga.value,
        MapEntry(
          chapterSortKey,
          jsonEncode(
            {"key": val.key.name, "value": val.value},
          ),
        ),
      );
    });
    isPageLoading.value = true;
    await loadManga();
    isPageLoading.value = false;
    await loadChapterList();
    downloadSocket.onMessage((source) {
      if (checkIfJson(source)) {
        downloadsList = Downloads.fromJson(source);
      }
    });
    super.onReady();
  }

  @override
  void onClose() {}
}
