// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../i18n/locale_keys.g.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key, this.popText});
  final String? popText;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pop(),
      child: Text(popText ?? LocaleKeys.cancel.tr()),
    );
  }
}
