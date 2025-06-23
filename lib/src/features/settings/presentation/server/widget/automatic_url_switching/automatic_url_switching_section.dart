// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../constants/enum.dart';
import '../../../../../../global_providers/global_providers.dart';
import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../widgets/popup_widgets/radio_list_popup.dart';
import '../../../../../../widgets/section_title.dart';
import '../../../../domain/automatic_url_switching/external_url_config.dart';
import '../../../../domain/automatic_url_switching/local_network_config.dart';
import '../../../../domain/network_detector/network_detector.dart';
import '../client/server_port_tile/server_port_tile.dart';
import 'widgets/external_url_config_tile.dart';
import 'widgets/external_url_dialog.dart';
import 'widgets/global_credentials_popup.dart';
import 'widgets/local_network_config_tile.dart';
import 'widgets/local_network_dialog.dart';
import 'widgets/permission_request_dialog.dart';
import 'widgets/test_connection_dialog.dart';

class AutomaticUrlSwitchingSection extends ConsumerWidget {
  const AutomaticUrlSwitchingSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final automaticSwitching = ref.watch(automaticUrlSwitchingProvider);
    final localNetworkConfigs = ref.watch(localNetworkConfigsProvider);
    final externalUrls = ref.watch(externalNetworkUrlConfigsProvider);
    final activeUrl = ref.watch(activeServerUrlProvider);
    final globalAuthEnabled = ref.watch(globalAuthenticationEnabledProvider);
    final globalAuthType = ref.watch(globalAuthTypeProvider);

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
                  shouldRequest = await PermissionRequestDialog.show(context);
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
                        content: Text(
                            l10n.automaticUrlSwitchingEnabledWithoutPermission),
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

          // Global Authentication Section
          const Divider(),
          SectionTitle(title: context.l10n.globalAuthentication),
          SwitchListTile(
            title: Text(context.l10n.enableGlobalAuthentication),
            subtitle: Text(context.l10n.globalAuthenticationDescription),
            value: globalAuthEnabled ?? false,
            onChanged: (value) {
              ref
                  .read(globalAuthenticationEnabledProvider.notifier)
                  .update(value);
            },
          ),

          if (globalAuthEnabled == true) ...[
            // Global Authentication Type Tile (matches AuthTypeTile UX)
            ListTile(
              leading: const Icon(Icons.security_rounded),
              title: Text(context.l10n.authType),
              subtitle: globalAuthType != null
                  ? Text(globalAuthType.toLocale(context))
                  : null,
              onTap: () => showDialog(
                context: context,
                builder: (context) => RadioListPopup<AuthType>(
                  title: context.l10n.authType,
                  optionList: AuthType.values,
                  getOptionTitle: (value) => value.toLocale(context),
                  value: globalAuthType ?? AuthType.none,
                  onChange: (enumValue) {
                    ref.read(globalAuthTypeProvider.notifier).update(enumValue);
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            // Global Credentials Tile (matches manual auth UX)
            if (globalAuthType != null && globalAuthType != AuthType.none)
              ListTile(
                leading: const Icon(Icons.password_rounded),
                title: Text(context.l10n.credentials),
                onTap: () {
                  GlobalCredentialsPopup.show(context);
                },
              ),
          ],

          // Local Network Configuration
          const Divider(),
          SectionTitle(title: context.l10n.localNetwork),
          ListTile(
            leading: const Icon(Icons.wifi),
            title: Text(context.l10n.localNetworks),
            subtitle: Text(
              context.l10n
                  .localNetworksConfigured(localNetworkConfigs?.length ?? 0),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const LocalNetworkDialog(),
              ),
            ),
          ),

          if (!localNetworkConfigs.isBlank)
            ...localNetworkConfigs!.asMap().entries.map((entry) {
              final index = entry.key;
              final config = entry.value;
              return LocalNetworkConfigTile(
                config: config,
                index: index,
                onEdit: () => showDialog(
                  context: context,
                  builder: (context) => LocalNetworkDialog(
                    index: index,
                    currentConfig: config,
                  ),
                ),
                onTest: () => _TestConnectionHelper.testLocalNetwork(
                    context, ref, config),
              );
            }),

          // External URLs
          const Divider(),
          SectionTitle(title: context.l10n.externalNetwork),
          ListTile(
            leading: const Icon(Icons.cloud),
            title: Text(context.l10n.externalUrls),
            subtitle: Text(
              context.l10n.externalUrlsConfigured(externalUrls?.length ?? 0),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const ExternalUrlDialog(),
              ),
            ),
          ),

          if (!externalUrls.isBlank)
            ...externalUrls!.asMap().entries.map((entry) {
              final index = entry.key;
              final config = entry.value;
              return ExternalUrlConfigTile(
                config: config,
                index: index,
                onEdit: () => showDialog(
                  context: context,
                  builder: (context) => ExternalUrlDialog(
                    index: index,
                    currentConfig: config,
                  ),
                ),
                onTest: () =>
                    _TestConnectionHelper.testExternalUrl(context, ref, config),
              );
            }),

          if (!kIsWeb) ...[
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(context.l10n.networkInformation),
              subtitle: Text(context.l10n.networkInformationDescription),
            ),
          ],
        ],
      ],
    );
  }
}

class _TestConnectionHelper {
  static void testExternalUrl(
      BuildContext context, WidgetRef ref, ExternalUrlConfig config) async {
    _showTestDialog(context, () async {
      final globalAuthEnabled =
          ref.read(globalAuthenticationEnabledProvider) ?? false;
      Map<String, String>? auth;

      if (globalAuthEnabled) {
        final authType = ref.read(globalAuthTypeProvider);
        final username = ref.read(globalUsernameProvider);
        final password = ref.read(globalPasswordProvider);

        if (authType == AuthType.basic &&
            !username.isBlank &&
            !password.isBlank) {
          auth = {'username': username!, 'password': password!};
        }
      } else {
        if (config.authType == AuthType.basic &&
            !config.username.isBlank &&
            !config.password.isBlank) {
          auth = {'username': config.username!, 'password': config.password!};
        }
      }

      return await NetworkDetector.isServerReachableWithAuth(config.url, auth);
    });
  }

  static void testLocalNetwork(
      BuildContext context, WidgetRef ref, LocalNetworkConfig config) async {
    _showTestDialog(context, () async {
      final serverPort = ref.read(serverPortProvider);
      final globalAuthEnabled =
          ref.read(globalAuthenticationEnabledProvider) ?? false;

      // Generate the full URL with port
      final generatedUrl = await NetworkDetector.generateLocalNetworkUrl(
        config.serverUrl,
        serverPort,
      );

      if (generatedUrl == null) {
        return false;
      }

      Map<String, String>? auth;

      if (globalAuthEnabled) {
        final authType = ref.read(globalAuthTypeProvider);
        final username = ref.read(globalUsernameProvider);
        final password = ref.read(globalPasswordProvider);

        if (authType == AuthType.basic &&
            !username.isBlank &&
            !password.isBlank) {
          auth = {'username': username!, 'password': password!};
        }
      } else {
        if (config.authType == AuthType.basic &&
            !config.username.isBlank &&
            !config.password.isBlank) {
          auth = {'username': config.username!, 'password': config.password!};
        }
      }

      return await NetworkDetector.isServerReachableWithAuth(
          generatedUrl, auth);
    });
  }

  static void _showTestDialog(
      BuildContext context, Future<bool> Function() testFunction) {
    TestConnectionDialog.show(context, testFunction);
  }
}
