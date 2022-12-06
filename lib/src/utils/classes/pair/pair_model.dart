// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pair_model.freezed.dart';

@freezed
class Pair<F, S> with _$Pair<F, S> {
  factory Pair({
    required F first,
    required S second,
  }) = _Pair<F, S>;
}
