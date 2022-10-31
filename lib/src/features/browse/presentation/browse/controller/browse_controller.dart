// 📦 Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'browse_controller.g.dart';

@riverpod
class BrowseScreenShowSearch extends _$BrowseScreenShowSearch {
  @override
  bool build() => false;
  void toggle() => state = !state;
}
