// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🐦 Flutter imports:

/// Constant sizes to be used in the app (paddings, gaps, rounded corners etc.)
enum Edge {
  a8(EdgeInsets.all(8)),
  a16(EdgeInsets.all(16)),
  h16v8(EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)),
  v8(EdgeInsets.symmetric(vertical: 8));

  const Edge(this.size);

  final EdgeInsetsGeometry size;
}

enum Box {
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

  const Box(this.size);

  final SizedBox size;
}
