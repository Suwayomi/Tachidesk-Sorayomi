import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/utils/days_ago.dart';
import '../../../core/values/api_url.dart';
import '../../../data/download_queue_value_model.dart';
import '../../../data/manga_page_model.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/updates_controller.dart';

class UpdatesView extends GetView<UpdatesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() => FloatingActionButton(
            backgroundColor: Get.theme.colorScheme.primary,
            child: controller.isFirstPage
                ? CircularProgressIndicator(
                    color: Get.theme.colorScheme.onPrimary,
                  )
                : Icon(
                    Icons.refresh_outlined,
                    color: Get.theme.colorScheme.onPrimary,
                  ),
            onPressed: () => controller.getNextPage(isRefresh: true),
          )),
      body: Obx(() => controller.isFirstPage
          ? Center(child: CircularProgressIndicator())
          : ((controller.updateRecentChapter.pageList?.isNotEmpty ?? false))
              ? GroupedListView(
                  padding: EdgeInsets.all(8),
                  controller: controller.scrollController,
                  order: GroupedListOrder.DESC,
                  itemComparator: (MangaPage element1, MangaPage element2) =>
                      element1.chapter!.uploadDate!.compareTo(
                    element2.chapter!.uploadDate!,
                  ),
                  elements: controller.updateRecentChapter.pageList!.reversed
                      .toList(),
                  groupBy: (MangaPage element) {
                    final time = DateTime.fromMillisecondsSinceEpoch(
                        element.chapter!.fetchedAt! * 1000);
                    return DateTime(time.year, time.month, time.day);
                  },
                  itemBuilder: (context, MangaPage item) {
                    return ListTile(
                      onTap: () => Get.toNamed(Routes.manga +
                          "/${item.manga!.id}/chapter/${item.chapter!.index}"),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          controller.localStorageService.baseURL +
                              (item.manga?.thumbnailUrl ?? ""),
                          height: 48,
                          width: 48,
                          fit: BoxFit.cover,
                          errorBuilder: (context, object, stack) => Image.asset(
                            logoURL,
                            height: 48,
                            width: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        item.manga?.title ?? "",
                        style: TextStyle(
                            color: item.chapter?.read ?? false
                                ? Colors.grey
                                : null),
                      ),
                      subtitle: Text(
                        item.chapter?.name ?? "",
                        style: TextStyle(
                            color: item.chapter?.read ?? false
                                ? Colors.grey
                                : null),
                      ),
                      trailing: DownloadState(
                        controller: controller,
                        item: item,
                      ),
                    );
                  },
                  groupSeparatorBuilder: (DateTime value) => ListTile(
                    title: Text(convertToAgo(value)),
                  ),
                )
              : EmoticonsView(emptyType: LocaleKeys.screenTitle_updates.tr)),
    );
  }
}

class DownloadState extends StatelessWidget {
  const DownloadState({Key? key, required this.controller, required this.item})
      : super(key: key);
  final UpdatesController controller;
  final MangaPage item;
  @override
  Widget build(BuildContext context) {
    Rx<DownloadQueueValue> downloadingChapter = DownloadQueueValue().obs;
    RxBool isDownloading = controller.downloadsController.downloadsList.queue!
        .any(
          (e) =>
              e.chapterIndex == item.chapter!.index &&
              e.mangaId == item.chapter!.mangaId,
        )
        .obs;
    late StreamSubscription subscription;
    if (isDownloading.value == true) {
      subscription = controller.downloadsController.downloadsListObs
          .listen((downloads) async {
        downloadingChapter.value = downloads.queue!.firstWhere(
          (element) =>
              element.chapterIndex == item.chapter!.index &&
              element.mangaId == item.chapter!.mangaId,
          orElse: () => DownloadQueueValue(),
        );
        if (downloadingChapter.value.state == "Queued" ||
            downloadingChapter.value.state == "Downloading") {
          isDownloading.value = true;
        }
        if (downloadingChapter.value.state == "Finished") {
          isDownloading.value = false;
          item.chapter!.downloaded = true;
          controller.updateRecentChapterObs.refresh();
          subscription.cancel();
        }
        if (downloadingChapter.value.state == null &&
            !item.chapter!.downloaded!) {
          isDownloading.value = false;
          item.chapter!.downloaded = false;
          controller.updateRecentChapterObs.refresh();
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
                  (item.chapter?.downloaded ?? false) ||
                          downloadingChapter.value.state == "Finished"
                      ? Icons.check_circle_rounded
                      : Icons.download_for_offline_outlined,
                ),
          onPressed: () async {
            if (isDownloading.value == true) {
              isDownloading.value = false;
              controller.deleteFromDownloadQueue(item.chapter!);
              return;
            }
            if (item.chapter?.downloaded ?? false) {
              await controller.deleteDownload(item.chapter!);
              item.chapter!.downloaded = false;
              controller.updateRecentChapterObs.refresh();
            } else {
              isDownloading.value = true;
              await controller.startDownload(item.chapter!);
              subscription = controller.downloadsController.downloadsListObs
                  .listen((downloads) async {
                downloadingChapter.value = downloads.queue!.firstWhere(
                  (element) =>
                      element.chapterIndex == item.chapter!.index &&
                      element.mangaId == item.chapter!.mangaId,
                  orElse: () => DownloadQueueValue(),
                );
                if (downloadingChapter.value.state == "Queued" ||
                    downloadingChapter.value.state == "Downloading") {
                  isDownloading.value = true;
                }
                if (downloadingChapter.value.state == "Finished") {
                  isDownloading.value = false;
                  item.chapter!.downloaded = true;
                  subscription.cancel();
                  controller.updateRecentChapterObs.refresh();
                }
                if (downloadingChapter.value.state == null &&
                    !item.chapter!.downloaded!) {
                  isDownloading.value = false;
                  item.chapter!.downloaded = false;
                  subscription.cancel();
                  controller.updateRecentChapterObs.refresh();
                }
              });
            }
          },
        ));
  }
}
