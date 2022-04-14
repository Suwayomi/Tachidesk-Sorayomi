import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/values/api_url.dart';
import '../../../core/values/string.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.screenTitle_about.tr),
        ),
        body: Obx(
          () => ListView(
            children: [
              ImageIcon(
                AssetImage(iconLightTextNbgPngURL),
                size: context.height * .2,
              ),
              Divider(thickness: 2),
              ListTile(
                title: Text(LocaleKeys.aboutScreen_client.tr),
                subtitle: Text(LocaleKeys.aboutScreen_sorayomi.tr),
              ),
              ListTile(
                title: Text(LocaleKeys.aboutScreen_clientVersion.tr),
                subtitle: Text("v" + (controller.version ?? "")),
              ),
              ListTile(
                title: Text(LocaleKeys.aboutScreen_checkForUpdates.tr),
                onTap: () {
                  controller.checkUpdate();
                },
              ),
              Divider(thickness: 2),
              ListTile(
                title: Text(LocaleKeys.aboutScreen_server.tr),
                subtitle: Text(controller.about?.name ?? ""),
              ),
              ListTile(
                title: Text(LocaleKeys.aboutScreen_channel.tr),
                subtitle: Text(controller.about?.buildType ?? ""),
              ),
              ListTile(
                title: Text(LocaleKeys.aboutScreen_serverVersion.tr),
                subtitle: Text(controller.about?.version ??
                    "" +
                        (controller.about?.buildType == "Stable"
                            ? " - ${controller.about?.revision}"
                            : "")),
              ),
              ListTile(
                title: Text(LocaleKeys.aboutScreen_buildTime.tr),
                subtitle: Text(
                  DateFormat("MMMM dd, yyyy hh:mm aaa").format(
                    DateTime.fromMillisecondsSinceEpoch(
                        (controller.about?.buildTime ?? 0) * 1000),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      label: Text(LocaleKeys.aboutScreen_discord.tr),
                      onPressed: () async {
                        if (!await launch(controller.about?.discord ?? "",
                            forceSafariVC: false, forceWebView: false)) {
                          Clipboard.setData(
                            ClipboardData(
                              text: controller.about?.discord,
                            ),
                          );
                          Get.rawSnackbar(
                            title: LocaleKeys.error_launchURL_title.trParams({
                              "website": LocaleKeys.aboutScreen_discord.tr,
                            }),
                            message:
                                LocaleKeys.error_launchURL_message.trParams(
                              {"url": controller.about?.discord ?? ""},
                            ),
                          );
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.discord,
                      ),
                    ),
                    TextButton.icon(
                      label: Text(
                        LocaleKeys.aboutScreen_gitHub.tr +
                            " (${LocaleKeys.aboutScreen_sorayomi.tr})",
                      ),
                      onPressed: () async {
                        if (!await launch(sorayomiGithubUrl,
                            forceSafariVC: false, forceWebView: false)) {
                          Clipboard.setData(
                            ClipboardData(
                              text: sorayomiGithubUrl,
                            ),
                          );
                          Get.rawSnackbar(
                            title: LocaleKeys.error_launchURL_title.trParams({
                              "website": LocaleKeys.aboutScreen_gitHub.tr,
                            }),
                            message:
                                LocaleKeys.error_launchURL_message.trParams(
                              {"url": sorayomiGithubUrl},
                            ),
                          );
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.github,
                      ),
                    ),
                    TextButton.icon(
                      label: Text(
                        LocaleKeys.aboutScreen_gitHub.tr +
                            " (${LocaleKeys.aboutScreen_server.tr})",
                      ),
                      onPressed: () async {
                        if (!await launch(controller.about?.github ?? "",
                            forceSafariVC: false, forceWebView: false)) {
                          Clipboard.setData(
                            ClipboardData(
                              text: controller.about?.github,
                            ),
                          );
                          Get.rawSnackbar(
                            title: LocaleKeys.error_launchURL_title.trParams({
                              "website": LocaleKeys.aboutScreen_gitHub.tr,
                            }),
                            message:
                                LocaleKeys.error_launchURL_message.trParams(
                              {"url": controller.about?.github ?? ""},
                            ),
                          );
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.github,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
