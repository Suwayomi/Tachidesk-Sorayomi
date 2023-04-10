// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/endpoints.dart';
import '../constants/enum.dart';
import '../features/settings/presentation/server/widget/credential_popup/credentials_popup.dart';
import '../features/settings/widgets/server_url_tile/server_url_tile.dart';
import '../global_providers/global_providers.dart';

class ServerImage extends ConsumerWidget {
  const ServerImage({
    super.key,
    required this.imageUrl,
    this.size,
    this.fit,
    this.appendApiToUrl = false,
    this.progressIndicatorBuilder,
    this.wrapper,
  });

  final String imageUrl;
  final Size? size;
  final BoxFit? fit;
  final bool appendApiToUrl;
  final Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder;
  final Widget Function(Widget child)? wrapper;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseUrl = ref.watch(serverUrlProvider);
    final authType = ref.watch(authTypeKeyProvider);
    final basicToken = ref.watch(credentialsProvider);
    final baseApi =
        "${Endpoints.baseApi(baseUrl: baseUrl, appendApiToUrl: appendApiToUrl)}"
        "$imageUrl";
    return CachedNetworkImage(
      imageUrl: baseApi,
      height: size?.height,
      cacheManager: DefaultCacheManager(),
      httpHeaders: authType == AuthType.basic && basicToken != null
          ? {"Authorization": basicToken}
          : null,
      width: size?.width,
      fit: fit ?? BoxFit.cover,
      imageRenderMethodForWeb: authType == AuthType.basic && basicToken != null
          ? ImageRenderMethodForWeb.HttpGet
          : ImageRenderMethodForWeb.HtmlImage,
      progressIndicatorBuilder: progressIndicatorBuilder == null
          ? null
          : (context, url, progress) => wrapper != null
              ? wrapper!(progressIndicatorBuilder!(context, url, progress))
              : progressIndicatorBuilder!(context, url, progress),
      errorWidget: (context, error, stackTrace) => wrapper != null
          ? wrapper!(
              const Icon(
                Icons.broken_image_rounded,
                color: Colors.grey,
              ),
            )
          : const Icon(
              Icons.broken_image_rounded,
              color: Colors.grey,
            ),
    );
  }
}

class ServerImageWithCpi extends StatelessWidget {
  const ServerImageWithCpi({
    super.key,
    required this.url,
    required this.outerSize,
    required this.innerSize,
    required this.isLoading,
  });
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
