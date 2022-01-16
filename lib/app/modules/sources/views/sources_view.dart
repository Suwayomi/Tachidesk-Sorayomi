import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:tachidesk_flutter/app/core/constants/api_url.dart';
import 'package:tachidesk_flutter/app/core/utils/language.dart';
import 'package:tachidesk_flutter/generated/locales.g.dart';

import '../../../data/source_model.dart';
import '../controllers/sources_controller.dart';

class SourcesView extends GetView<SourcesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupedListView(
        padding: EdgeInsets.all(8),
        floatingHeader: true,
        elements: controller.sourceList,
        groupHeaderBuilder: (Source element) => ListTile(
          title: Text(langCodeToName(element.lang ?? "").nativeName),
        ),
        groupBy: (Source source) => source.lang,
        itemBuilder: (context, Source source) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                controller.localStorageService.baseURL + (source.iconUrl ?? ""),
                height: 48,
                width: 48,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset(logoURL),
              ),
            ),
            title: Text(source.displayName ?? source.name ?? ""),
            subtitle: Text(langCodeToName(source.lang ?? "").nativeName),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.sourceScreen_latest.tr,
                    style: TextStyle(
                      color: context.theme.indicatorColor,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
