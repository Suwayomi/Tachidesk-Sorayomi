// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

extension DurationExt on Duration {
  String get formatToMinSec {
    List<String> min = toString().split('.').first.split(":");
    return "${min[1]}:${min[2]}";
  }
}
