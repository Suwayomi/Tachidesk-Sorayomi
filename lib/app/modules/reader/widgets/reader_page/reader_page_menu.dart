import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../generated/locales.g.dart';
import '../../controllers/reader_controller.dart';

class ReaderPageMenu extends StatelessWidget {
  const ReaderPageMenu({
    Key? key,
    required this.controller,
    required this.pageNumber,
    this.headers,
  }) : super(key: key);
  final ReaderController controller;
  final int pageNumber;
  final Map<String, String>? headers;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.save_alt_rounded),
            title: Text("Save"),
            onTap: () async {
              if (Platform.isAndroid) {
                if (!await launchUrl(
                  Uri.parse(controller.getChapterPage(pageNumber)),
                  mode: LaunchMode.externalApplication,
                )) {
                  Clipboard.setData(
                    ClipboardData(text: controller.getChapterPage(pageNumber)),
                  );
                  Get.rawSnackbar(
                    title: LocaleKeys.error_launchURL_title.trParams({
                      "website": LocaleKeys.appTitle.tr,
                    }),
                    message: LocaleKeys.error_launchURL_message.trParams(
                      {"url": controller.getChapterPage(pageNumber)},
                    ),
                  );
                }
              } else {
                final File file = await controller.cacheManager.getSingleFile(
                  controller.getChapterPage(pageNumber),
                  headers: headers,
                );
                final imageName =
                    "${controller.manga.title ?? controller.mangaId}"
                    "_${controller.chapterIndex}_$pageNumber";
                final appDir = await getApplicationDocumentsDirectory();

                final localPath = join(appDir.path, imageName);

                final imageFile = File(localPath);
                await imageFile.writeAsBytes(file.readAsBytesSync());

                Clipboard.setData(ClipboardData(text: localPath));
                Get.back();
                Get.rawSnackbar(
                  title: LocaleKeys.readerScreen_savedImagePathTitle.tr,
                  message: localPath,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
