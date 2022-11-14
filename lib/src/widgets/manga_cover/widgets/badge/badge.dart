// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../../constants/app_sizes.dart';
import '../../../../constants/db_keys.dart';
import '../../../../features/manga_book/domain/manga/manga_model.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../../utils/storage/local/shared_preferences_client.dart';

part 'badge.g.dart';

@riverpod
class DownloadedBadge extends _$DownloadedBadge
    with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.downloadedBadge.name,
        initial: DBKeys.downloadedBadge.initial,
      );
}

@riverpod
class UnreadBadge extends _$UnreadBadge with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.unreadBadge.name,
        initial: DBKeys.unreadBadge.initial,
      );
}

class BadgesRow extends ConsumerWidget {
  const BadgesRow({
    super.key,
    required this.manga,
    this.needSpacer = false,
    this.needCountBadges = false,
  });
  final Manga manga;
  final bool needSpacer;
  final bool needCountBadges;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadedBadge = ref.watch(downloadedBadgeProvider) ?? true;
    final unreadBadge = ref.watch(unreadBadgeProvider) ?? true;
    // final languageBadge = ref.watch(languageBadgeProvider) ?? false;
    return Padding(
      padding: KEdgeInsets.a8.size,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!needCountBadges && (manga.inLibrary ?? false))
            ClipRRect(
              borderRadius: KBorderRadius.r16.radius,
              child: Badge(
                text: LocaleKeys.inLibrary.tr(),
                color: context.theme.colorScheme.primary,
                textColor: context.theme.colorScheme.onPrimary,
              ),
            ),
          if (needCountBadges) ...[
            ClipRRect(
              borderRadius: KBorderRadius.r16.radius,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (manga.unreadCount.isGreaterThan(0) && unreadBadge)
                    Badge(
                      text: "${manga.unreadCount ?? 0}",
                      color: context.theme.colorScheme.primary,
                      textColor: context.theme.colorScheme.onPrimary,
                    ),
                  if (manga.downloadCount.isGreaterThan(0) && downloadedBadge)
                    Badge(
                      text: "${manga.downloadCount ?? 0}",
                      color: context.theme.colorScheme.secondary,
                      textColor: context.theme.colorScheme.onSecondary,
                    ),
                ],
              ),
            ),
            if (needSpacer) const Spacer(),
            // if ((manga.source?.lang?.code) != null && languageBadge)
            //   ClipRRect(
            //     borderRadius: KBorderRadius.r16.radius,
            //     child: Badge(
            //       text: manga.source!.lang!.code!,
            //       color: context.theme.colorScheme.tertiary,
            //       textColor: context.theme.colorScheme.onTertiary,
            //     ),
            //   )
          ],
        ],
      ),
    );
  }
}

class Badge extends StatelessWidget {
  const Badge({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
  });
  final String text;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: color,
      shape: const RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
