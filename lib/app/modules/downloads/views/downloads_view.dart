import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/downloads_controller.dart';

class DownloadsView extends GetView<DownloadsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Obx(() => controller.downloadsList.queue?.isNotEmpty ?? false
              ? FloatingActionButton.extended(
                  onPressed: () {
                    if (controller.downloadsList.status == "Stopped") {
                      controller.downloadsRepository.startDownloads();
                    } else {
                      controller.downloadsRepository.stopDownloads();
                    }
                  },
                  icon: Icon(controller.downloadsList.status == "Stopped"
                      ? Icons.play_arrow_rounded
                      : Icons.pause_rounded),
                  label: Text(
                    controller.downloadsList.status == "Stopped"
                        ? LocaleKeys.downloadScreen_resume.tr
                        : LocaleKeys.downloadScreen_pause.tr,
                  ),
                )
              : Container()),
      body: Obx(() => controller.downloadsList.queue?.isNotEmpty ?? false
          ? ReorderableListView.builder(
              itemCount: controller.downloadsList.queue?.length ?? 0,
              buildDefaultDragHandles: false,
              itemBuilder: (context, index) {
                final item = controller.downloadsList.queue?[index];
                return ListTile(
                  key: ValueKey(item),
                  title: Text(item?.manga?.title ?? ""),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item?.chapter?.name ?? ""),
                            Text("${((item?.progress ?? 0) * 100).toInt()}%"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: LinearProgressIndicator(
                          value: item?.progress,
                          color: context.theme.indicatorColor,
                          semanticsValue:
                              "${(item?.progress ?? 0 * 100).toInt()}%",
                        ),
                      ),
                    ],
                  ),
                  // leading: ReorderableDragStartListener(
                  //   index: index,
                  //   child: Icon(
                  //     Icons.drag_handle_outlined,
                  //   ),
                  // ),
                  // trailing: PopupMenuButton(
                  //   itemBuilder: (context) => [
                  //     PopupMenuItem(
                  //       child: Text("Delete"),
                  //       onTap: () async => print((await controller
                  //               .downloadQueueValueRepository
                  //               .startDownload(item!))
                  //           .body),
                  //     ),
                  //   ],
                  // ),
                );
              },
              onReorder: (int oldIndex, int newIndex) {},
            )
          : EmoticonsView(emptyType: LocaleKeys.screenTitle_downloads.tr)),
    );
  }
}
