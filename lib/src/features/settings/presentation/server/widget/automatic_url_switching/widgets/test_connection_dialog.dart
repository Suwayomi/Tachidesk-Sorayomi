// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../../../../../utils/extensions/custom_extensions.dart';

/// A dialog widget that shows the result of a connection test
class TestConnectionDialog extends StatelessWidget {
  const TestConnectionDialog({
    super.key,
    required this.testFunction,
  });

  final Future<bool> Function() testFunction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.testConnectionResult),
      content: FutureBuilder<bool>(
        future: testFunction(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 16),
                Text(context.l10n.testing),
              ],
            );
          } else if (snapshot.hasData) {
            final success = snapshot.data!;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  success ? Icons.check_circle : Icons.error,
                  color: success ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 16),
                Text(success
                    ? context.l10n.connectionSuccessful
                    : context.l10n.connectionFailed),
              ],
            );
          } else {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error, color: Colors.red),
                const SizedBox(width: 16),
                Text(context.l10n.connectionFailed),
              ],
            );
          }
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.l10n.close),
        ),
      ],
    );
  }

  /// Shows the test connection dialog
  static void show(BuildContext context, Future<bool> Function() testFunction) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => TestConnectionDialog(testFunction: testFunction),
    );
  }
}
