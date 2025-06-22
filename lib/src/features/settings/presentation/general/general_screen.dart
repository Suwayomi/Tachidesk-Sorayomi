// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/language_list.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../widgets/popup_widgets/radio_list_popup.dart';
import 'quick_search_toggle/quick_search_toggle_tile.dart';
import 'timeout_settings/timeout_settings_section.dart';

class GeneralScreen extends ConsumerWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.general)),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.translate_rounded),
            title: Text(context.l10n.appLanguage),
            subtitle: Text(getLanguageNameFormLocale(context.currentLocale)),
            onTap: () => showDialog(
              context: context,
              builder: (context) => RadioListPopup<Locale>(
                title: context.l10n.appLanguage,
                optionList: AppLocalizations.supportedLocales,
                value: context.currentLocale,
                onChange: (locale) {
                  ref.read(l10nProvider.notifier).update(locale);
                  Navigator.pop(context);
                },
                getOptionTitle: getLanguageNameFormLocale,
                getOptionSubtitle: getLanguageNameInEnFormLocale,
              ),
            ),
          ),
          //TODO: Implement clear cache

          // ListTile(
          //   leading: const Icon(Icons.cleaning_services_rounded),
          //   title: Text(context.l10n.clearCache),
          //   onTap: () async {
          //     await ref.read(graphQlClientProvider).;
          //     DefaultCacheManager().emptyCache();
          //     if (context.mounted) {
          //       ref.read(toastProvider)?.show(context.l10n.cacheCleared);
          //     }
          //   },
          // ),
          const QuickSearchToggleTile(),
          const TimeoutSettingsSection(),
        ],
      ),
    );
  }
}
