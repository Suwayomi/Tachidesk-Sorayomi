import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../data/chapter_model.dart';
import '../../../data/repository/download_queue_value_repository.dart';
import '../../../data/repository/update_recent_chapter_repository.dart';
import '../../../data/update_recent_chapter_model.dart';
import '../../downloads/controllers/downloads_controller.dart';

class UpdatesController extends GetxController {
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
            await UpdateRecentChapterRepository.getUpdateRecentChapter(_page);
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
      updateRecentChapter =
          await UpdateRecentChapterRepository.getUpdateRecentChapter(_page);
      _page += 1;
      isFirstPage = false;
    }
  }

  Future startDownload(Chapter chapter) =>
      DownloadQueueValueRepository.startDownload(chapter);

  Future deleteDownload(Chapter chapter) =>
      DownloadQueueValueRepository.deleteDownload(chapter);
  Future deleteFromDownloadQueue(Chapter chapter) =>
      DownloadQueueValueRepository.deleteFromDownloadQueue(chapter);

  @override
  void onReady() async {
    await getNextPage();
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
