// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/db_keys.dart';
import '../../constants/endpoints.dart';
import '../../constants/enum.dart';
import '../../features/settings/presentation/server/widget/client/server_port_tile/server_port_tile.dart';
import '../../features/settings/presentation/server/widget/client/server_url_tile/server_url_tile.dart';
import '../../features/settings/presentation/server/widget/credential_popup/credentials_popup.dart';
import '../../global_providers/global_providers.dart';
import 'custom_extensions.dart';

extension CacheManagerExtension on CacheManager {
  Future<File> getServerFile(WidgetRef ref, String url,
      {bool appendApiToUrl = true}) async {
    final authType = ref.read(authTypeKeyProvider);
    final basicToken = ref.read(credentialsProvider);
    
    // Use automatic URL switching if enabled, never fallback to manual URL
    final automaticSwitching = ref.read(automaticUrlSwitchingProvider);
    String baseUrl;
    
    if (automaticSwitching == true) {
      try {
        final activeUrl = await ref.read(activeServerUrlProvider.future);
        // When automatic switching is enabled, only use the active URL
        // If no automatic URL is available, use a placeholder that will fail gracefully
        baseUrl = activeUrl ?? 'http://localhost:4567';
      } catch (e) {
        // Use placeholder when automatic switching fails
        baseUrl = 'http://localhost:4567';
      }
    } else {
      baseUrl = ref.read(serverUrlProvider) ?? DBKeys.serverUrl.initial;
    }
    
    final baseApi = "${Endpoints.baseApi(
      baseUrl: baseUrl,
      port: automaticSwitching == true ? null : ref.read(serverPortProvider),
      addPort: automaticSwitching == true ? false : ref.read(serverPortToggleProvider).ifNull(),
      appendApiToUrl: appendApiToUrl,
    )}"
        "$url";
    return await getSingleFile(
      baseApi,
      headers: authType == AuthType.basic && basicToken != null
          ? {"Authorization": basicToken}
          : null,
    );
  }
}
