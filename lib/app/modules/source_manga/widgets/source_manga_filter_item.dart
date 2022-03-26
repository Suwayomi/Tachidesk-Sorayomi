import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/source_manga_controller.dart';

class SourceMangaFilterItem extends StatelessWidget {
  const SourceMangaFilterItem({
    Key? key,
    required this.controller,
    required this.index,
    this.groupIndex,
  }) : super(key: key);
  final SourceMangaController controller;
  final int index;
  final int? groupIndex;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isInGroup = groupIndex != null;
      Map<String, dynamic> item = isInGroup
          ? controller.sourceMangaFilterList[groupIndex!]["filter"]["state"]
              [index]
          : controller.sourceMangaFilterList[index];
      switch (item["type"]) {
        case "CheckBox":
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: item["filter"]["state"] as bool,
            onChanged: (value) {
              (isInGroup
                      ? controller.sourceMangaFilterList[groupIndex!]["filter"]
                          ["state"][index]
                      : controller.sourceMangaFilterList[index])["filter"]
                  ["state"] = value;
              controller.sourceMangaFilterListRefresh();
            },
            title: Text(item["filter"]["name"]),
          );

        case "TriState":
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            tristate: true,
            value: item["filter"]["state"] != 0
                ? (item["filter"]["state"] == 1 ? true : false)
                : null,
            onChanged: (value) {
              (isInGroup
                      ? controller.sourceMangaFilterList[groupIndex!]["filter"]
                          ["state"][index]
                      : controller.sourceMangaFilterList[index])["filter"]
                  ["state"] = value != null ? (value ? 1 : 2) : 0;
              controller.sourceMangaFilterListRefresh();
            },
            title: Text(item["filter"]["name"]),
          );

        case "Header":
          return ListTile(
            title: Text(item["filter"]["name"]),
            dense: true,
          );

        case "Separator":
          return Divider();

        case "Select":
          List<DropdownMenuItem<int>> items = [];
          for (int i = 0; i < (item["filter"]["values"] as List).length; i++) {
            items.add(
              DropdownMenuItem(
                child: Text(
                  item["filter"]["values"][i],
                ),
                value: i,
              ),
            );
          }
          return ListTile(
            leading: Text(item["filter"]["name"]),
            trailing: DropdownButton(
                value: item["filter"]["state"] as int,
                underline: Container(),
                items: items,
                onChanged: (value) {
                  (isInGroup
                          ? controller.sourceMangaFilterList[groupIndex!]
                              ["filter"]["state"][index]
                          : controller.sourceMangaFilterList[index])["filter"]
                      ["state"] = value;
                  controller.sourceMangaFilterListRefresh();
                }),
          );

        case "Text":
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              initialValue: item["filter"]["state"],
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: item["filter"]["name"],
              ),
              onChanged: (value) {
                (isInGroup
                        ? controller.sourceMangaFilterList[groupIndex!]
                            ["filter"]["state"][index]
                        : controller.sourceMangaFilterList[index])["filter"]
                    ["state"] = value;
              },
            ),
          );
        case "Group":
          return ObxValue(
            (RxBool value) {
              return ExpansionPanelList(
                elevation: 0,
                expansionCallback: (_, isExpanded) {
                  value.value = !isExpanded;
                },
                children: [
                  ExpansionPanel(
                    backgroundColor: Get.theme.canvasColor,
                    isExpanded: value.value,
                    headerBuilder: ((context, isExpanded) => ListTile(
                          title: Text(item["filter"]["name"]),
                        )),
                    body: ListView.builder(
                      controller: ScrollController(),
                      itemCount: item["filter"]["state"].length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return SourceMangaFilterItem(
                          controller: controller,
                          index: index,
                          groupIndex: this.index,
                        );
                      },
                    ),
                  )
                ],
              );
            },
            true.obs,
          );
        case "Sort":
          return ObxValue(
            (RxBool value) {
              return ExpansionPanelList(
                elevation: 0,
                expansionCallback: (_, isExpanded) {
                  value.value = !isExpanded;
                },
                children: [
                  ExpansionPanel(
                    backgroundColor: Get.theme.canvasColor,
                    isExpanded: value.value,
                    headerBuilder: ((context, isExpanded) => ListTile(
                          title: Text(item["filter"]["name"]),
                        )),
                    body: ListView.builder(
                      controller: ScrollController(),
                      itemCount: item["filter"]["values"].length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: item["filter"]["state"]["index"] == index
                              ? Icon(
                                  item["filter"]["state"]["ascending"]
                                      ? Icons.arrow_upward_rounded
                                      : Icons.arrow_downward_rounded,
                                )
                              : SizedBox(width: Get.theme.iconTheme.size),
                          title: Text(item["filter"]["values"][index]),
                          onTap: () {
                            if (item["filter"]["state"]["index"] == index) {
                              item["filter"]["state"]["ascending"] =
                                  !item["filter"]["state"]["ascending"];
                            } else {
                              item["filter"]["state"]["index"] = index;
                            }
                            controller.sourceMangaFilterListRefresh();
                          },
                        );
                      },
                    ),
                  )
                ],
              );
            },
            true.obs,
          );

        default:
          return Container(
            child: Text("data"),
          );
      }
    });
  }
}
