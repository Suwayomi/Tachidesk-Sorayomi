import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/enums/auth_type.dart';
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
                  autofocus: true,
                  controller: controller.baseUrlEditingController,
                  onSubmitted: (value) => controller.submitURL(value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: (LocaleKeys.serverSettingsScreen_url.tr),
                  ),
                ),
                onConfirm: () => controller
                    .submitURL(controller.baseUrlEditingController.text),
                onCancel: () {},
              );
            },
          ),
          Obx(() => ListTile(
                title: Text(LocaleKeys.serverSettingsScreen_baseAuthType.tr),
                trailing: DropdownButton(
                  value: controller.baseAuthType,
                  items: AuthType.values
                      .map<DropdownMenuItem<AuthType>>(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.name,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (AuthType? authType) {
                    controller.localStorageService.setBaseAuthType(
                      authType ?? AuthType.none,
                    );
                    if (authType == AuthType.basic) {
                      Get.defaultDialog(
                        title: LocaleKeys.serverSettingsScreen_url.tr,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                autofocus: true,
                                controller:
                                    controller.userNameEditingController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: (LocaleKeys
                                      .serverSettingsScreen_userName.tr),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                autofocus: true,
                                controller:
                                    controller.passwordEditingController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: (LocaleKeys
                                      .serverSettingsScreen_password.tr),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onConfirm: () {
                          controller.localStorageService.setAuthUserName(
                            controller.userNameEditingController.text,
                          );
                          controller.localStorageService.setAuthPassword(
                            controller.passwordEditingController.text,
                          );
                          Get.back();
                        },
                        onCancel: () {},
                      );
                    }
                  },
                ),
              )),
          ListTile(
            title: Text(LocaleKeys.serverSettingsScreen_webUI.tr),
            trailing: Icon(Icons.open_in_new),
            onTap: () async {
              if (!await launchUrl(
                Uri.parse(controller.baseURL),
                mode: LaunchMode.externalApplication,
              )) {
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
