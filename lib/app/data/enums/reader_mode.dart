import 'package:collection/collection.dart';

enum ReaderMode {
  continuousHorizontalLTR,
  continuousHorizontalRTL,
  continuousVertical,
  singleHorizontalLTR,
  singleHorizontalRTL,
  singleVertical,
  webtoon,
}

ReaderMode? stringToReaderMode(String? value) {
  return ReaderMode.values.firstWhereOrNull((element) => element.name == value);
}
