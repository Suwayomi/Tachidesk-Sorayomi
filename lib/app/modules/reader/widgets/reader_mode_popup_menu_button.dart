import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/enums/reader_mode.dart';
import '../controllers/reader_controller.dart';

class ReaderModePopupMenuButton extends StatelessWidget {
  const ReaderModePopupMenuButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReaderController controller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.app_settings_alt_outlined,
      ),
      initialValue: controller.readerMode,
      onSelected: (ReaderMode? e) => controller.changeReaderMode(e),
      itemBuilder: (context) {
        return ReaderMode.values
            .map<PopupMenuEntry<ReaderMode>>(
              (e) => PopupMenuItem(
                value: e,
                child: ListTile(
                  title: Text(
                    (LocaleKeys.readerScreen_readerMode_ + e.name).tr,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            )
            .toList();
      },
    );
  }
}
