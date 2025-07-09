// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../global_providers/global_providers.dart';

/// Manages app lifecycle events for automatic URL switching
class AppLifecycleManager with WidgetsBindingObserver {
  AppLifecycleManager(this.ref);
  
  final WidgetRef ref;
  DateTime? _lastRefresh;
  static const Duration _refreshCooldown = Duration(seconds: 30); // Prevent too frequent refreshes
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    
    // Check if automatic URL switching is enabled
    final automaticSwitching = ref.read(automaticUrlSwitchingProvider);
    if (automaticSwitching != true) return;
    
    switch (state) {
      case AppLifecycleState.resumed:
        // App came back to foreground - refresh active URL with cooldown
        _refreshActiveUrlWithCooldown();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        // No action needed for these states
        break;
    }
  }
  
  /// Refresh the active server URL with cooldown to prevent excessive network calls
  void _refreshActiveUrlWithCooldown() {
    final now = DateTime.now();
    
    // Check cooldown period
    if (_lastRefresh != null && 
        now.difference(_lastRefresh!) < _refreshCooldown) {
      return; // Skip refresh if too recent
    }
    
    _lastRefresh = now;
    _refreshActiveUrl();
  }
  
  /// Refresh the active server URL
  void _refreshActiveUrl() {
    try {
      ref.read(activeServerUrlProvider.notifier).refreshDebounced();
    } catch (e) {
      // Ignore errors during refresh - provider will handle them gracefully
    }
  }
  
  /// Initialize lifecycle management
  void initialize() {
    WidgetsBinding.instance.addObserver(this);
    
    // Also refresh on first initialization if automatic switching is enabled
    final automaticSwitching = ref.read(automaticUrlSwitchingProvider);
    if (automaticSwitching == true) {
      // Use a post-frame callback to ensure all providers are initialized
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _refreshActiveUrl();
      });
    }
  }
  
  /// Cleanup lifecycle management
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
