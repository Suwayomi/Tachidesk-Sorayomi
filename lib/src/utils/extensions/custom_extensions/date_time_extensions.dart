// 📦 Package imports:
import 'package:intl/intl.dart';

// 📦 Package imports:

extension DateTimeExtensions on DateTime? {
  bool get isNull => this == null;

  String get toDateString {
    if (isNull) return "";
    return DateFormat.yMMMd().format(this!);
  }

  String get convertToDaysAgo {
    if (isNull) return "";
    Duration diff = DateTime.now().difference(this!);

    if (diff.inDays < 1) {
      return "Today";
    } else if (diff.inDays < 2) {
      return 'Yesterday';
    } else if (diff.inDays < 10) {
      return '${diff.inDays} days ago';
    } else {
      return DateFormat.yMMMd().format(this!);
    }
  }
}
