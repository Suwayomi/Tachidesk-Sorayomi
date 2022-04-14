import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/enums/reader_mode.dart';
import '../controllers/reader_controller.dart';

class ReaderModePopupMenuButton extends StatelessWidget {
  const ReaderModePopupMenuButton({
    Key? key,
    required this.controller,
    this.icon,
    this.child,
  }) : super(key: key);
  final Widget? icon;
  final Widget? child;
  final ReaderController controller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: icon,
      tooltip: LocaleKeys.readerScreen_readerMode_.tr,
      child: child,
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
