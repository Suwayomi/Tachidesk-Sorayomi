import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/utils/language.dart';
import '../../../core/values/api_url.dart';
import '../../../data/enums/auth_type.dart';
import '../../../data/extension_model.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/extensions_controller.dart';

class ExtensionsView extends GetView<ExtensionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : controller.groupByMap.keys.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.groupByMap.keys.length,
                  itemBuilder: (context, index) {
                    final currentKey = controller.groupByLanguageList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          key: Key(currentKey.toString()),
                          child: ListTile(
                            title: Text(currentKey.nativeName),
                          ),
                        ),
                        ...mapIndexed(
                          controller.groupByMap[currentKey]
                            ?..sort(
                              (e1, e2) => (e1.name ?? e1.apkName ?? "")
                                  .compareTo(e2.name ?? e2.apkName ?? ""),
                            ),
                          (iterator, Extension source) {
                            RxBool isWaiting = false.obs;
                            return Container(
                              key: Key(
                                  '$currentKey-${source.toString()}-$iterator'),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        controller.localStorageService.baseURL +
                                            (source.iconUrl ?? ""),
                                    httpHeaders: controller.localStorageService
                                                .baseAuthType ==
                                            AuthType.basic
                                        ? {
                                            "Authorization": controller
                                                .localStorageService.basicAuth,
                                          }
                                        : null,
                                    height: 48,
                                    width: 48,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, error, stackTrace) =>
                                        Image.asset(iconPngURL),
                                  ),
                                ),
                                title: Text(source.name ?? source.name ?? ""),
                                subtitle: Text.rich(
                                  // Text(
                                  //   +
                                  //       " " +
                                  //       (source.versionName ?? "") +
                                  //       " " +
                                  //       (source.isNsfw ?? false
                                  //           ? LocaleKeys.extensionScreen_nsfw.tr
                                  //           : "")),
                                  TextSpan(
                                      text: langCodeToName(source.lang ?? "")
                                          .nativeName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: " ${source.versionName ?? ""} ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                        TextSpan(
                                          text: source.isNsfw ?? false
                                              ? LocaleKeys
                                                  .extensionScreen_nsfw.tr
                                              : "",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ]),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Obx(
                                      () => TextButton(
                                        onPressed: isWaiting.value
                                            ? null
                                            : () async {
                                                if (source.installed ?? false) {
                                                  if (source.hasUpdate ??
                                                      false) {
                                                    isWaiting.value = true;
                                                    await controller.repository
                                                        .updateExtension(
                                                            source.pkgName!);
                                                    controller
                                                        .updateExtensionList();
                                                  } else {
                                                    isWaiting.value = true;
                                                    await controller.repository
                                                        .uninstallExtension(
                                                            source.pkgName!);
                                                    controller
                                                        .updateExtensionList();
                                                  }
                                                } else {
                                                  isWaiting.value = true;
                                                  await controller.repository
                                                      .installExtension(
                                                          source.pkgName!);
                                                  controller
                                                      .updateExtensionList();
                                                }
                                              },
                                        child: Text(
                                          isWaiting.value
                                              ? LocaleKeys
                                                  .extensionScreen_wait.tr
                                              : source.installed ?? false
                                                  ? (source.hasUpdate ?? false
                                                      ? LocaleKeys
                                                          .extensionScreen_update
                                                          .tr
                                                      : LocaleKeys
                                                          .extensionScreen_uninstall
                                                          .tr)
                                                  : LocaleKeys
                                                      .extensionScreen_install
                                                      .tr,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                )
              : EmoticonsView(
                  text: "${LocaleKeys.no.tr} "
                      "${LocaleKeys.extensionScreen_extensionsError.tr}",
                  button: TextButton(
                    child: Text(LocaleKeys.extensionScreen_reload.tr),
                    onPressed: () => controller.updateExtensionList(),
                  ),
                ),
    ));
  }
}

Iterable<E> mapIndexed<E, T>(
    Iterable<T>? items, E Function(int index, T item) f) sync* {
  var index = 0;
  if (items == null) return;
  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}
