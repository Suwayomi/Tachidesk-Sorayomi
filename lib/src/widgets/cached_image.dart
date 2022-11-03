// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/global_providers/global_providers.dart';
import '../constants/db_keys.dart';
import '../constants/enum.dart';
import '../features/settings/presentation/server/credentials_popup.dart';
import '../features/settings/widgets/server_url_tile.dart';

class CachedImage extends ConsumerWidget {
  const CachedImage({super.key, required this.imageUrl, this.size});

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
      errorWidget: (context, error, stackTrace) =>
          const Icon(Icons.broken_image_rounded),
    );
  }
}
