// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../constants/db_keys.dart';
import '../constants/enum.dart';
import '../features/settings/presentation/server/widget/credential_popup/credentials_popup.dart';
import '../features/settings/widgets/server_url_tile/server_url_tile.dart';
import '../global_providers/global_providers.dart';

class ServerImage extends ConsumerWidget {
  const ServerImage({super.key, required this.imageUrl, this.size});

  final String imageUrl;
  final Size? size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseUrl = ref.watch(serverUrlProvider);
    final authType = ref.watch(authTypeKeyProvider);
    final basicToken = ref.watch(credentialsProvider);
    return CachedNetworkImage(
      imageUrl: (baseUrl ?? DBKeys.serverUrl.initial) + imageUrl,
      height: size?.height,
      httpHeaders: authType == AuthType.basic && basicToken != null
          ? {"Authorization": basicToken}
          : null,
      width: size?.width,
      fit: BoxFit.cover,
      errorWidget: (context, error, stackTrace) => const Icon(
        Icons.broken_image_rounded,
        color: Colors.grey,
      ),
    );
  }
}

class ServerImageWithCpi extends StatelessWidget {
  const ServerImageWithCpi({
    Key? key,
    required this.url,
    required this.outerSize,
    required this.innerSize,
    required this.isLoading,
  }) : super(key: key);
  final bool isLoading;
  final Size outerSize;
  final Size innerSize;
  final String url;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox.fromSize(
            size: outerSize,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                ServerImage(
                  imageUrl: url,
                  size: innerSize,
                )
              ],
            ),
          )
        : ServerImage(imageUrl: url, size: outerSize);
  }
}
