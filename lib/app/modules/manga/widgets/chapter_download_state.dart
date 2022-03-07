import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/chapter_model.dart';
import '../../../data/download_queue_value_model.dart';
import '../controllers/manga_controller.dart';

class ChapterDownloadState extends StatelessWidget {
  const ChapterDownloadState(
      {Key? key, required this.controller, required this.item})
      : super(key: key);
  final MangaController controller;
  final Chapter item;
  @override
  Widget build(BuildContext context) {
    Rx<DownloadQueueValue> downloadingChapter = DownloadQueueValue().obs;
    RxBool isDownloading = controller.downloadsList.queue!
        .any(
          (e) => e.chapterIndex == item.index && e.mangaId == item.mangaId,
        )
        .obs;
    late StreamSubscription subscription;
    if (isDownloading.value == true) {
      subscription = controller.downloadsListObs.listen((downloads) async {
        downloadingChapter.value = downloads.queue!.firstWhere(
          (element) =>
              element.chapterIndex == item.index &&
              element.mangaId == item.mangaId,
          orElse: () => DownloadQueueValue(),
        );

        if (downloadingChapter.value.state == "Queued" ||
            downloadingChapter.value.state == "Downloading") {
          isDownloading.value = true;
        }
        if (downloadingChapter.value.state == "Finished") {
          isDownloading.value = false;
          item.downloaded = true;
          controller.chapterListRefresh();
          subscription.cancel();
        }
        if (downloadingChapter.value.state == null && !item.downloaded!) {
          isDownloading.value = false;
          item.downloaded = false;
          controller.chapterListRefresh();
          subscription.cancel();
        }
      });
    }

    return Obx(() => IconButton(
          icon: isDownloading.value
              ? CircularProgressIndicator(
                  value: downloadingChapter.value.state != "Queued"
                      ? downloadingChapter.value.progress
                      : null,
                  color: Get.theme.iconTheme.color,
                )
              : Icon(
                  (item.downloaded ?? false) ||
                          downloadingChapter.value.state == "Finished"
                      ? Icons.check_circle_rounded
                      : Icons.download_for_offline_outlined,
                ),
          onPressed: () async {
            if (isDownloading.value == true) {
              isDownloading.value = false;
              controller.deleteFromDownloadQueue(item);
              return;
            }
            if (item.downloaded ?? false) {
              await controller.deleteDownload(item);
              item.downloaded = false;
              controller.chapterListRefresh();
            } else {
              isDownloading.value = true;
              await controller.startDownload(item);
              subscription =
                  controller.downloadsListObs.listen((downloads) async {
                downloadingChapter.value = downloads.queue!.firstWhere(
                  (element) =>
                      element.chapterIndex == item.index &&
                      element.mangaId == item.mangaId,
                  orElse: () => DownloadQueueValue(),
                );
                if (downloadingChapter.value.state == "Queued" ||
                    downloadingChapter.value.state == "Downloading") {
                  isDownloading.value = true;
                }
                if (downloadingChapter.value.state == "Finished") {
                  isDownloading.value = false;
                  item.downloaded = true;
                  subscription.cancel();
                  controller.chapterListRefresh();
                }
                if (downloadingChapter.value.state == null &&
                    !item.downloaded!) {
                  isDownloading.value = false;
                  item.downloaded = false;
                  subscription.cancel();
                  controller.chapterListRefresh();
                }
              });
            }
          },
        ));
  }
}
