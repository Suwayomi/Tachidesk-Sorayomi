// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'browse_controller.g.dart';

@riverpod
class BrowseScreenShowSearch extends _$BrowseScreenShowSearch {
  @override
  bool build() => false;
  void toggle() => state = !state;
}
