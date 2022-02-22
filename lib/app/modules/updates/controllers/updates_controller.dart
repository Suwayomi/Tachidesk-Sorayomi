import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../data/chapter_model.dart';
import '../../../data/update_recent_chapter_model.dart';
import '../../downloads/controllers/downloads_controller.dart';
import '../repository/updates_repository.dart';

class UpdatesController extends GetxController {
  final UpdatesRepository repository = UpdatesRepository();
  int _page = 0;
  final ScrollController scrollController = ScrollController();
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();

  final DownloadsController downloadsController =
      Get.find<DownloadsController>();

  final Rx<UpdateRecentChapter> _updateRecentChapter =
      UpdateRecentChapter(hasNextPage: true, pageList: []).obs;

  final RxBool _isFirstPage = true.obs;

  bool get isFirstPage => _isFirstPage.value;
  set isFirstPage(bool value) => _isFirstPage.value = value;

  UpdateRecentChapter get updateRecentChapter => _updateRecentChapter.value;
  Rx<UpdateRecentChapter> get updateRecentChapterObs => _updateRecentChapter;
  set updateRecentChapter(UpdateRecentChapter value) =>
      _updateRecentChapter.value = value;

  Future getNextPage({bool isRefresh = false}) async {
    if (!isRefresh) {
      if (updateRecentChapter.hasNextPage ?? true) {
        final updateRecentChapterTemp =
            await repository.getUpdateRecentChapter(_page);
        updateRecentChapter.hasNextPage = updateRecentChapterTemp.hasNextPage;
        updateRecentChapter.pageList
            ?.addAll(updateRecentChapterTemp.pageList ?? []);
        _updateRecentChapter.refresh();
        _page += 1;
        isFirstPage = false;
      }
    } else {
      isFirstPage = true;
      _page = 0;
      try {
        updateRecentChapter = await repository.getUpdateRecentChapter(_page);
        _page += 1;
      } catch (e) {
        //
      }
      isFirstPage = false;
    }
  }

  Future startDownload(Chapter chapter) => repository.startDownload(chapter);

  Future deleteDownload(Chapter chapter) =>
      repository.deletedownloadedChapter(chapter);

  Future deleteFromDownloadQueue(Chapter chapter) =>
      repository.deleteFromDownloadQueue(chapter);

  @override
  void onReady() async {
    await getNextPage(isRefresh: true);
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await getNextPage();
      }
    });
    super.onReady();
  }

  @override
  void onClose() {}
}
