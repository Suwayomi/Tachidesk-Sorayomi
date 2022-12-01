// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

const kTabSize = Size.fromHeight(kAppBarBottomHeight);
const kAppBarBottomHeight = 64.0;
const kDrawerWidth = 384.0;

Size kCalculateAppBarBottomSize(List<bool> checks) {
  final multiplier =
      checks.map((e) => e ? 1 : 0).toList().fold(0, (v1, v2) => v1 + v2);
  return Size.fromHeight(kAppBarBottomHeight * multiplier);
}

/// Constant sizes to be used in the app (paddings, gaps, rounded corners etc.)
enum KEdgeInsets {
  a8(EdgeInsets.all(8)),
  a4(EdgeInsets.all(4)),
  a16(EdgeInsets.all(16)),
  h8v4(EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
  h8v16(EdgeInsets.symmetric(horizontal: 8, vertical: 16)),
  h16v8(EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)),
  h4v8(EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0)),
  h16v4(EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0)),
  h16(EdgeInsets.symmetric(horizontal: 16.0)),
  h8(EdgeInsets.symmetric(horizontal: 8.0)),
  v8(EdgeInsets.symmetric(vertical: 8)),
  v4(EdgeInsets.symmetric(vertical: 4)),
  h4(EdgeInsets.symmetric(horizontal: 4)),
  ol4(EdgeInsets.only(left: 4)),
  ;

  const KEdgeInsets(this.size);

  final EdgeInsetsGeometry size;
}

enum KSizedBox {
  h4(SizedBox(height: 4)),
  w4(SizedBox(width: 4)),
  h16(SizedBox(height: 16)),
  w16(SizedBox(width: 16)),
  h32(SizedBox(height: 32)),
  w32(SizedBox(width: 32)),
  h64(SizedBox(height: 64)),
  w64(SizedBox(width: 64)),
  h96(SizedBox(height: 96)),
  w96(SizedBox(width: 96)),
  ;

  const KSizedBox(this.size);

  final SizedBox size;
}

enum KBorderRadius {
  r8(BorderRadius.all(Radius.circular(8))),
  r12(BorderRadius.all(Radius.circular(12))),
  r16(BorderRadius.all(Radius.circular(16))),
  rT16(BorderRadius.vertical(top: Radius.circular(16))),
  r32(BorderRadius.all(Radius.circular(32))),
  ;

  const KBorderRadius(this.radius);
  final BorderRadius radius;
}

enum KRadius {
  r8(Radius.circular(8)),
  r12(Radius.circular(12)),
  r16(Radius.circular(16)),
  rT16(Radius.circular(16)),
  r32(Radius.circular(32)),
  ;

  const KRadius(this.radius);
  final Radius radius;
}

const mangaCoverGridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 192,
  crossAxisSpacing: 2.0,
  mainAxisSpacing: 2.0,
  childAspectRatio: 0.75,
);
