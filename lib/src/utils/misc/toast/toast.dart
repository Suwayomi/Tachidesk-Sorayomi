// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/app_sizes.dart';

part 'toast.g.dart';

class Toast {
  Toast(this._context) {
    _fToast = FToast().init(_context);
  }
  final BuildContext _context;
  late FToast _fToast;

  void instantShow(String msg) {
    close();
    show(msg);
  }

  void show(String msg, {bool withMicrotask = false}) {
    {
      if (withMicrotask) {
        Future.microtask(() => _fToast.showToast(
              child: ToastWidget(text: msg),
              gravity: ToastGravity.BOTTOM,
            ));
      } else {
        _fToast.showToast(
          child: ToastWidget(text: msg),
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
  }

  void showError(String error) => _fToast.showToast(
        child: ToastWidget(
          text: error,
          backgroundColor: Colors.red.shade400,
        ),
        gravity: ToastGravity.TOP,
      );

  void close() => _fToast.removeCustomToast();
}

class ToastWidget extends StatelessWidget {
  const ToastWidget({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.textColor,
  });
  final String text;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      text,
      style: TextStyle(color: textColor ?? Colors.white),
      textAlign: TextAlign.center,
    );
    return Container(
      padding: KEdgeInsets.h16v8.size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: backgroundColor ?? Colors.black54,
      ),
      child: icon != null
          ? Row(
              children: [
                icon!,
                KSizedBox.w16.size,
                textWidget,
              ],
            )
          : textWidget,
    );
  }
}

@riverpod
Toast toast(ToastRef ref, BuildContext context) => Toast(context);
