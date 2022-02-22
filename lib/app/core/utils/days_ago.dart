import 'package:intl/intl.dart';

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);

  if (diff.inDays < 1) {
    return "Today";
  } else if (diff.inDays < 2) {
    return 'Yesterday';
  } else if (diff.inDays < 10) {
    return '${diff.inDays} days ago';
  } else {
    return DateFormat("dd/MM/yyyy").format(input);
  }
}
