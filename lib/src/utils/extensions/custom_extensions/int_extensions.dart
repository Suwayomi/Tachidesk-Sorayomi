// 📦 Package imports:
import 'package:intl/intl.dart';

extension IntExtensions on int? {
  bool get isNull => this == null;
  bool get isZero => this != null ? this! == 0 : false;
  bool liesBetween({int lower = 0, int upper = 1}) =>
      this != null ? this! >= lower && this! <= upper : false;

  String get toDateString {
    if (isNull) return "";
    return DateFormat.yMMMd().format(
      DateTime.fromMillisecondsSinceEpoch(this!),
    );
  }
}
