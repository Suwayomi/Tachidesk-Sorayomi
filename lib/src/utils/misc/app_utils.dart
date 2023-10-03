import 'package:flutter/material.dart';

abstract class AppUtils {
  static Widget wrapIf(Widget Function(Widget)? wrapper, Widget child) {
    if (wrapper != null) {
      return wrapper(child);
    }
    return child;
  }
}
