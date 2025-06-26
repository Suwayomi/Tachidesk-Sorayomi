// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

/// Configuration constants for infinity continuous reader mode
class InfinityContinuousConfig {
  const InfinityContinuousConfig._();

  /// Minimum overscroll distance to trigger chapter loading
  static const double overscrollThreshold = 10.0;

  /// Higher threshold for user feedback to avoid spam
  static const double feedbackThreshold = 30.0;

  /// Minimum visibility threshold for position tracking
  static const double minVisibleAreaThreshold = 0.4;

  /// Scroll animation duration
  static const Duration scrollAnimationDuration = Duration(milliseconds: 200);

  /// Feedback cooldown to prevent spam
  static const Duration feedbackCooldown = Duration(seconds: 3);

  /// Navigation threshold for determining when to move to next/previous item
  static const double navigationTrailingThreshold = 0.8;
  static const double navigationLeadingThreshold = 0.2;

  /// Default scroll animation curve
  static const Curve scrollAnimationCurve = Curves.easeOut;

  /// Cache extent multiplier for different scroll directions
  static const double verticalCacheMultiplier = 1.0;
  static const double horizontalCacheMultiplier = 2.0;

  /// Page height/width ratio for different orientations
  static const double verticalPageHeightRatio = 0.7;
  static const double horizontalPageWidthRatio = 0.7;

  /// Interactive viewer max scale for pinch to zoom
  static const double maxZoomScale = 5.0;
}
