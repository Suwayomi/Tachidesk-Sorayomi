// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../global_providers/global_providers.dart';
import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../widgets/input_popup/domain/settings_prop_type.dart';
import '../../../../../../widgets/input_popup/settings_prop_tile.dart';
import '../../../../../../widgets/section_title.dart';
import '../../../../domain/network_detector/network_detector.dart';

class AutomaticUrlSwitchingSection extends ConsumerWidget {
  const AutomaticUrlSwitchingSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final automaticSwitching = ref.watch(automaticUrlSwitchingProvider);
    final localWifiName = ref.watch(localNetworkWifiNameProvider);
    final localServerUrl = ref.watch(localNetworkServerUrlProvider);
    final externalUrls = ref.watch(externalNetworkUrlsProvider);
    final activeUrl = ref.watch(activeServerUrlProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: context.l10n.automaticUrlSwitching),

        // Main toggle
        SwitchListTile(
          title: Text(context.l10n.enableAutomaticUrlSwitching),
          subtitle: Text(
            automaticSwitching == true
                ? context.l10n.automaticUrlSwitchingEnabled
                : context.l10n.automaticUrlSwitchingDisabled,
          ),
          value: automaticSwitching ?? false,
          onChanged: (value) async {
            if (value) {
              // Always enable the setting first
              ref.read(automaticUrlSwitchingProvider.notifier).update(value);
              
              // Store context references before async operations
              final l10n = context.l10n;
              final scaffoldMessenger = ScaffoldMessenger.of(context);

              // Check permissions when enabling
              final hasPermissions =
                  await NetworkDetector.hasRequiredPermissions();
              if (!hasPermissions) {
                // Show permission dialog using stored context references
                bool? shouldRequest;
                if (context.mounted) {
                  shouldRequest = await showDialog<bool>(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                      title: Text(l10n.permissionRequired),
                      content: Text(l10n.permissionRequiredMessage),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(false),
                          child: Text(l10n.cancel),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(true),
                          child: Text(l10n.grantPermission),
                        ),
                      ],
                    ),
                  );
                }

                if (shouldRequest == true) {
                  final granted =
                      await NetworkDetector.requestRequiredPermissions();
                  if (!granted) {
                    // Show permission denied message but keep setting enabled
                    if (context.mounted) {
                      scaffoldMessenger.showSnackBar(
                        SnackBar(
                          content: Text(l10n.permissionDeniedMessage),
                          action: SnackBarAction(
                            label: l10n.openSettings,
                            onPressed: () => openAppSettings(),
                          ),
                        ),
                      );
                    }
                  }
                } else {
                  // User cancelled permission request but setting remains enabled
                  if (context.mounted) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(
                        content: Text(l10n.automaticUrlSwitchingEnabledWithoutPermission),
                        action: SnackBarAction(
                          label: l10n.openSettings,
                          onPressed: () => openAppSettings(),
                        ),
                      ),
                    );
                  }
                }
              }
            } else {
              // Disable without permission check
              ref.read(automaticUrlSwitchingProvider.notifier).update(value);
            }
          },
        ),

        if (automaticSwitching == true) ...[
          // Current active URL status
          ListTile(
            leading: Icon(
              activeUrl.when(
                data: (url) => url != null ? Icons.check_circle : Icons.error,
                loading: () => Icons.hourglass_empty,
                error: (_, __) => Icons.error,
              ),
              color: activeUrl.when(
                data: (url) => url != null ? Colors.green : Colors.red,
                loading: () => Colors.orange,
                error: (_, __) => Colors.red,
              ),
            ),
            title: Text(context.l10n.currentActiveUrl),
            subtitle: activeUrl.when(
              data: (url) => Text(url ?? context.l10n.noActiveUrlFound),
              loading: () => Text(context.l10n.detectingNetwork),
              error: (error, _) => Text('Error: $error'),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.read(activeServerUrlProvider.notifier).refresh();
              },
            ),
          ),

          // Local Network Configuration
          SettingsPropTile(
            title: context.l10n.localWifiNetworkName,
            subtitle: localWifiName?.isNotEmpty == true
                ? localWifiName
                : context.l10n.localWifiNetworkNameHint,
            leading: const Icon(Icons.wifi),
            type: SettingsPropType.textField(
              hintText: context.l10n.localWifiNetworkNameHint,
              value: localWifiName,
              onChanged: (value) async {
                ref.read(localNetworkWifiNameProvider.notifier).update(value);
                return;
              },
            ),
          ),

          SettingsPropTile(
            title: context.l10n.localServerUrl,
            subtitle: localServerUrl?.isNotEmpty == true
                ? localServerUrl
                : context.l10n.localServerUrlHint,
            leading: const Icon(Icons.home),
            type: SettingsPropType.textField(
              hintText: context.l10n.localServerUrlHint,
              value: localServerUrl,
              onChanged: (value) async {
                ref.read(localNetworkServerUrlProvider.notifier).update(value);
                return;
              },
            ),
          ),

          // External URLs
          ListTile(
            leading: const Icon(Icons.cloud),
            title: Text(context.l10n.externalUrls),
            subtitle: Text(
              context.l10n.externalUrlsConfigured(externalUrls?.length ?? 0),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _showAddExternalUrlDialog(context, ref),
            ),
          ),

          if (externalUrls?.isNotEmpty == true)
            ...externalUrls!.asMap().entries.map((entry) {
              final index = entry.key;
              final url = entry.value;
              return ListTile(
                leading: const Icon(Icons.language),
                title: Text(url),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () =>
                          _showEditExternalUrlDialog(context, ref, index, url),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref
                            .read(externalNetworkUrlsProvider.notifier)
                            .removeExternalUrl(url);
                      },
                    ),
                  ],
                ),
              );
            }),

          if (!kIsWeb)
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(context.l10n.networkInformation),
              subtitle: Text(context.l10n.networkInformationDescription),
            ),
        ],
      ],
    );
  }

  void _showAddExternalUrlDialog(BuildContext context, WidgetRef ref) {
    String newUrl = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.addExternalUrl),
        content: TextField(
          decoration: InputDecoration(
            labelText: context.l10n.externalUrls,
            hintText: context.l10n.externalUrlHint,
          ),
          onChanged: (value) => newUrl = value,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              if (newUrl.isNotEmpty) {
                // Store context references before async operation
                final navigator = Navigator.of(context);
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                final l10n = context.l10n;

                // Validate URL
                final result =
                    await NetworkDetector.validateExternalUrl(newUrl);
                if (result.isValid && result.validatedUrl != null) {
                  ref
                      .read(externalNetworkUrlsProvider.notifier)
                      .addExternalUrl(result.validatedUrl!);
                  navigator.pop();
                } else {
                  // Show error
                  scaffoldMessenger.showSnackBar(
                    SnackBar(
                        content: Text(l10n.urlValidationError(result.message))),
                  );
                }
              }
            },
            child: Text(context.l10n.add),
          ),
        ],
      ),
    );
  }

  void _showEditExternalUrlDialog(
      BuildContext context, WidgetRef ref, int index, String currentUrl) {
    String newUrl = currentUrl;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.editExternalUrl),
        content: TextField(
          decoration: InputDecoration(
            labelText: context.l10n.externalUrls,
            hintText: context.l10n.externalUrlHint,
          ),
          controller: TextEditingController(text: currentUrl),
          onChanged: (value) => newUrl = value,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              if (newUrl.isNotEmpty && newUrl != currentUrl) {
                // Store context references before async operation
                final navigator = Navigator.of(context);
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                final l10n = context.l10n;

                // Validate URL
                final result =
                    await NetworkDetector.validateExternalUrl(newUrl);
                if (result.isValid && result.validatedUrl != null) {
                  ref
                      .read(externalNetworkUrlsProvider.notifier)
                      .updateExternalUrl(index, result.validatedUrl!);
                  navigator.pop();
                } else {
                  // Show error
                  scaffoldMessenger.showSnackBar(
                    SnackBar(
                        content: Text(l10n.urlValidationError(result.message))),
                  );
                }
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(context.l10n.save),
          ),
        ],
      ),
    );
  }
}
