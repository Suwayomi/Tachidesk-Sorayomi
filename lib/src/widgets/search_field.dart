// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../constants/app_sizes.dart';
import '../i18n/locale_keys.g.dart';
import '../utils/extensions/custom_extensions/context_extensions.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onChanged,
    required this.onClose,
    this.hintText,
  });
  final String? hintText;
  final ValueChanged<String> onChanged;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isLargeTablet ? context.widthScale(scale: .3) : null,
      child: Padding(
        padding: KEdgeInsets.h16v8.size,
        child: TextField(
          autofocus: true,
          onChanged: onChanged,
          decoration: InputDecoration(
            isDense: true,
            border: const OutlineInputBorder(),
            hintText: LocaleKeys.search.tr(),
            suffixIcon: IconButton(
              onPressed: onClose,
              icon: const Icon(Icons.close_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
