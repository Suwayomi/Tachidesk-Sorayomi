// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/language_list.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../widgets/radio_list_popup.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.general.tr())),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.translate_rounded),
            title: Text(LocaleKeys.appLanguage.tr()),
            subtitle: Text(getLanguageNameFormLocale(context.locale)),
            onTap: () => showDialog(
              context: context,
              builder: (context) => RadioListPopup<Locale>(
                title: LocaleKeys.appLanguage.tr(),
                optionList: context.supportedLocales,
                value: context.locale,
                onChange: (locale) {
                  context.setLocale(locale);
                  context.pop();
                },
                optionDisplayName: getLanguageNameFormLocale,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
