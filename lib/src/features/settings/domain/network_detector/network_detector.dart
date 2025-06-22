// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class NetworkDetector {
  static const Duration connectionTimeout = Duration(seconds: 5);

  /// Get current WiFi SSID/name
  static Future<String?> getCurrentWifiName() async {
    try {
      final info = NetworkInfo();
      final wifiName = await info.getWifiName();

      // On Android, the result might be null if location permissions aren't granted
      // In this case, we'll just return null and the automatic switching won't work
      return wifiName;
    } catch (e) {
      // Handle permission errors gracefully
      return null;
    }
  }

  /// Get current local IP address
  static Future<String?> getCurrentLocalIP() async {
    try {
      final info = NetworkInfo();
      return await info.getWifiIP();
    } catch (e) {
      return null;
    }
  }

  /// Check if a server URL is reachable and responds correctly
  static Future<bool> isServerReachable(String serverUrl) async {
    try {
      // Ensure URL has protocol
      String url = serverUrl;
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        url = 'http://$url';
      }

      // Try to reach the server's about endpoint to verify it's a Suwayomi server
      final aboutUrl = '$url/api/v1/settings/about';
      final response = await http.get(
        Uri.parse(aboutUrl),
        headers: {'Accept': 'application/json'},
      ).timeout(connectionTimeout);

      // Check if response is successful and contains expected server info
      if (response.statusCode == 200) {
        final body = response.body.toLowerCase();
        return body.contains('suwayomi') || body.contains('tachidesk');
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Check if a server URL is reachable with authentication
  static Future<bool> isServerReachableWithAuth(
      String serverUrl, Map<String, String>? auth) async {
    try {
      // Ensure URL has protocol
      String url = serverUrl;
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        url = 'http://$url';
      }

      // Try to reach the server's about endpoint to verify it's a Suwayomi server
      final aboutUrl = '$url/api/v1/settings/about';

      // Prepare headers
      final headers = <String, String>{'Accept': 'application/json'};

      // Add basic auth if provided
      if (auth != null &&
          auth['username'] != null &&
          auth['password'] != null) {
        final credentials = '${auth['username']}:${auth['password']}';
        final encoded = base64Encode(utf8.encode(credentials));
        headers['Authorization'] = 'Basic $encoded';
      }

      final response = await http
          .get(
            Uri.parse(aboutUrl),
            headers: headers,
          )
          .timeout(connectionTimeout);

      // Check if response is successful and contains expected server info
      if (response.statusCode == 200) {
        final body = response.body.toLowerCase();
        return body.contains('suwayomi') || body.contains('tachidesk');
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Validate and test an external URL before adding it
  static Future<ValidationResult> validateExternalUrl(String url) async {
    try {
      // Basic URL validation
      String cleanUrl = url.trim();
      if (cleanUrl.isEmpty) {
        return ValidationResult(false, 'URL cannot be empty');
      }

      // Ensure URL has protocol
      if (!cleanUrl.startsWith('http://') && !cleanUrl.startsWith('https://')) {
        cleanUrl = 'https://$cleanUrl';
      }

      // Try to parse URL
      final uri = Uri.tryParse(cleanUrl);
      if (uri == null || uri.host.isEmpty) {
        return ValidationResult(false, 'Invalid URL format');
      }

      // Test if server is reachable
      final isReachable = await isServerReachable(cleanUrl);
      if (!isReachable) {
        return ValidationResult(
            false, 'Server is not reachable or not a valid Suwayomi server');
      }

      return ValidationResult(true, 'Server validated successfully', cleanUrl);
    } catch (e) {
      return ValidationResult(false, 'Error validating URL: ${e.toString()}');
    }
  }

  /// Generate local network URL with current IP
  static Future<String?> generateLocalNetworkUrl(
      String template, int? port) async {
    try {
      final localIP = await getCurrentLocalIP();
      if (localIP == null) return null;

      String url = template;
      if (url.isEmpty || url == 'local-ip') {
        url = 'http://local-ip${port != null ? ':$port' : ''}';
      }

      // Replace local-ip placeholder with actual IP
      return url.replaceAll('local-ip', localIP);
    } catch (e) {
      return null;
    }
  }

  /// Check if location permissions are granted for WiFi info access
  static Future<bool> hasLocationPermission() async {
    try {
      final status = await Permission.location.status;
      return status == PermissionStatus.granted;
    } catch (e) {
      return false;
    }
  }

  /// Request location permissions for WiFi info access
  static Future<bool> requestLocationPermission() async {
    try {
      final status = await Permission.location.request();
      return status == PermissionStatus.granted;
    } catch (e) {
      return false;
    }
  }

  /// Check if all required permissions are granted
  static Future<bool> hasRequiredPermissions() async {
    return await hasLocationPermission();
  }

  /// Request all required permissions
  static Future<bool> requestRequiredPermissions() async {
    return await requestLocationPermission();
  }
}

class ValidationResult {
  final bool isValid;
  final String message;
  final String? validatedUrl;

  ValidationResult(this.isValid, this.message, [this.validatedUrl]);
}
