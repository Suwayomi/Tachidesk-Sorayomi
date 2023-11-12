// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

part of '../custom_extensions.dart';

extension BoolExtensions on bool? {
  bool get isNull => this == null;
  bool get isNotNull => !isNull;
  bool ifNull([bool alternative = false]) => this ?? alternative;
  int get toInt => this != null ? (this! ? 1 : 2) : 0;
  int get toIntWithNegative => this != null ? (this! ? 1 : -1) : 0;
}
