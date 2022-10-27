// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../constants/app_sizes.dart';

// 🐦 Flutter imports:

// 📦 Package imports:

// 🌎 Project imports:

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

  void show(String msg) => _fToast.showToast(
        child: ToastWidget(text: msg),
        gravity: ToastGravity.BOTTOM,
      );

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
      padding: Edge.h16v8.size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: backgroundColor ?? Colors.black54,
      ),
      child: icon != null
          ? Row(
              children: [
                icon!,
                Box.w16.size,
                textWidget,
              ],
            )
          : textWidget,
    );
  }
}

final toastProvider =
    Provider.family<Toast, BuildContext>((ref, context) => Toast(context));
