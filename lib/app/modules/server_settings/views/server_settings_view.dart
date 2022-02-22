import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/server_settings_controller.dart';

class ServerSettingsView extends GetView<ServerSettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settingsScreen_server.tr),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(LocaleKeys.serverSettingsScreen_url.tr),
            subtitle: Obx(() => Text(controller.baseURL)),
            onTap: () {
              Get.defaultDialog(
                title: LocaleKeys.serverSettingsScreen_url.tr,
                content: TextField(
                  controller: controller.textEditingController,
                  onSubmitted: (value) => controller.submitURL(value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: (LocaleKeys.serverSettingsScreen_url.tr),
                  ),
                ),
                onConfirm: () =>
                    controller.submitURL(controller.textEditingController.text),
                onCancel: () {},
              );
            },
          ),
          ListTile(
            title: Text(LocaleKeys.serverSettingsScreen_webUI.tr),
            trailing: Icon(Icons.open_in_new),
            onTap: () async {
              if (!await launch(controller.baseURL,
                  forceSafariVC: false, forceWebView: false)) {
                Clipboard.setData(
                  ClipboardData(text: controller.baseURL),
                );
                Get.rawSnackbar(
                  title: LocaleKeys.error_launchURL_title.trParams({
                    "website": LocaleKeys.appTitle.tr,
                  }),
                  message: LocaleKeys.error_launchURL_message.trParams(
                    {"url": controller.baseURL},
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
