// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../../../../../utils/extensions/custom_extensions.dart';

/// A dialog widget for requesting permissions
class PermissionRequestDialog extends StatelessWidget {
  const PermissionRequestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.permissionRequired),
      content: Text(context.l10n.permissionRequiredMessage),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(context.l10n.cancel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(context.l10n.grantPermission),
        ),
      ],
    );
  }

  /// Shows the permission request dialog and returns the user's choice
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const PermissionRequestDialog(),
    );
  }
}
