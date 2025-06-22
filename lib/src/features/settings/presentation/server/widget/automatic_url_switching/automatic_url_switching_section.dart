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
import '../../../../../../widgets/section_title.dart';
import '../../../../domain/automatic_url_switching/external_url_config.dart';
import '../../../../domain/automatic_url_switching/local_network_config.dart';
import '../../../../domain/network_detector/network_detector.dart';

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
    final globalUsername = ref.watch(globalUsernameProvider);
    final globalPassword = ref.watch(globalPasswordProvider);

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

          // Global Authentication Section
          const Divider(),
          SectionTitle(title: context.l10n.globalAuthentication),
          SwitchListTile(
            title: Text(context.l10n.enableGlobalAuthentication),
            subtitle: Text(context.l10n.globalAuthenticationDescription),
            value: globalAuthEnabled ?? false,
            onChanged: (value) {
              ref.read(globalAuthenticationEnabledProvider.notifier).update(value);
            },
          ),

          if (globalAuthEnabled == true) ...[
            ListTile(
              leading: const Icon(Icons.security),
              title: DropdownButtonFormField<AuthType>(
                decoration: InputDecoration(
                  labelText: context.l10n.authenticationType,
                  border: InputBorder.none,
                ),
                value: globalAuthType ?? AuthType.none,
                items: AuthType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.toLocale(context)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    ref.read(globalAuthTypeProvider.notifier).update(value);
                  }
                },
              ),
            ),
            
            if (globalAuthType == AuthType.basic) ...[
              ListTile(
                leading: const Icon(Icons.person),
                title: TextField(
                  decoration: InputDecoration(
                    labelText: context.l10n.username,
                    border: InputBorder.none,
                  ),
                  controller: TextEditingController(text: globalUsername ?? ''),
                  onChanged: (value) {
                    ref.read(globalUsernameProvider.notifier).update(value);
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: TextField(
                  decoration: InputDecoration(
                    labelText: context.l10n.password,
                    border: InputBorder.none,
                  ),
                  controller: TextEditingController(text: globalPassword ?? ''),
                  obscureText: true,
                  onChanged: (value) {
                    ref.read(globalPasswordProvider.notifier).update(value);
                  },
                ),
              ),
            ],
          ],

          // Local Network Configuration
          const Divider(),
          SectionTitle(title: context.l10n.localNetwork),
          ListTile(
            leading: const Icon(Icons.wifi),
            title: Text(context.l10n.localNetworks),
            subtitle: Text(
              context.l10n.localNetworksConfigured(localNetworkConfigs?.length ?? 0),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _showAddLocalNetworkDialog(context, ref),
            ),
          ),

          if (localNetworkConfigs?.isNotEmpty == true)
            ...localNetworkConfigs!.asMap().entries.map((entry) {
              final index = entry.key;
              final config = entry.value;
              return ListTile(
                leading: const Icon(Icons.wifi),
                title: Text(config.wifiName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(config.serverUrl),
                    if (config.authType != AuthType.none)
                      Text('${config.authType.toLocale(context)} - ${config.username ?? 'No username'}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () =>
                          _showEditLocalNetworkDialog(context, ref, index, config),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref
                            .read(localNetworkConfigsProvider.notifier)
                            .removeLocalNetwork(config.wifiName);
                      },
                    ),
                  ],
                ),
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
              onPressed: () => _showAddExternalUrlDialog(context, ref),
            ),
          ),

          if (externalUrls?.isNotEmpty == true)
            ...externalUrls!.asMap().entries.map((entry) {
              final index = entry.key;
              final config = entry.value;
              return ListTile(
                leading: const Icon(Icons.language),
                title: Text(config.url),
                subtitle: config.authType != AuthType.none 
                    ? Text('${config.authType.toLocale(context)} - ${config.username ?? 'No username'}')
                    : null,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () =>
                          _showEditExternalUrlDialog(context, ref, index, config),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref
                            .read(externalNetworkUrlConfigsProvider.notifier)
                            .removeExternalUrl(config.url);
                      },
                    ),
                  ],
                ),
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

  void _showAddExternalUrlDialog(BuildContext context, WidgetRef ref) {
    String newUrl = '';
    AuthType authType = AuthType.none;
    String username = '';
    String password = '';
    
    final globalAuthEnabled = ref.read(globalAuthenticationEnabledProvider) ?? false;
    
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(context.l10n.addExternalUrl),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: context.l10n.externalUrls,
                    hintText: context.l10n.externalUrlHint,
                  ),
                  onChanged: (value) => newUrl = value,
                ),
                if (!globalAuthEnabled) ...[
                  const SizedBox(height: 16),
                  DropdownButtonFormField<AuthType>(
                    decoration: InputDecoration(
                      labelText: context.l10n.authenticationType,
                    ),
                    value: authType,
                    items: AuthType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type.toLocale(context)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        authType = value ?? AuthType.none;
                      });
                    },
                  ),
                  if (authType == AuthType.basic) ...[
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: context.l10n.username,
                      ),
                      onChanged: (value) => username = value,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: context.l10n.password,
                      ),
                      obscureText: true,
                      onChanged: (value) => password = value,
                    ),
                  ],
                ],
              ],
            ),
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
                    final config = ExternalUrlConfig(
                      url: result.validatedUrl!,
                      authType: globalAuthEnabled ? AuthType.none : authType,
                      username: globalAuthEnabled ? null : (authType == AuthType.basic ? username : null),
                      password: globalAuthEnabled ? null : (authType == AuthType.basic ? password : null),
                    );
                    ref
                        .read(externalNetworkUrlConfigsProvider.notifier)
                        .addExternalUrl(config);
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
      ),
    );
  }

  void _showEditExternalUrlDialog(
      BuildContext context, WidgetRef ref, int index, ExternalUrlConfig currentConfig) {
    String newUrl = currentConfig.url;
    AuthType authType = currentConfig.authType;
    String username = currentConfig.username ?? '';
    String password = currentConfig.password ?? '';
    
    final globalAuthEnabled = ref.read(globalAuthenticationEnabledProvider) ?? false;
    
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(context.l10n.editExternalUrl),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: context.l10n.externalUrls,
                    hintText: context.l10n.externalUrlHint,
                  ),
                  controller: TextEditingController(text: currentConfig.url),
                  onChanged: (value) => newUrl = value,
                ),
                if (!globalAuthEnabled) ...[
                  const SizedBox(height: 16),
                  DropdownButtonFormField<AuthType>(
                    decoration: InputDecoration(
                      labelText: context.l10n.authenticationType,
                    ),
                    value: authType,
                    items: AuthType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type.toLocale(context)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        authType = value ?? AuthType.none;
                      });
                    },
                  ),
                  if (authType == AuthType.basic) ...[
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: context.l10n.username,
                      ),
                      controller: TextEditingController(text: username),
                      onChanged: (value) => username = value,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: context.l10n.password,
                      ),
                      controller: TextEditingController(text: password),
                      obscureText: true,
                      onChanged: (value) => password = value,
                    ),
                  ],
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.cancel),
            ),
            TextButton(
              onPressed: () async {
                if (newUrl.isNotEmpty && (newUrl != currentConfig.url || 
                    authType != currentConfig.authType ||
                    username != (currentConfig.username ?? '') ||
                    password != (currentConfig.password ?? ''))) {
                  // Store context references before async operation
                  final navigator = Navigator.of(context);
                  final scaffoldMessenger = ScaffoldMessenger.of(context);
                  final l10n = context.l10n;

                  // Validate URL
                  final result =
                      await NetworkDetector.validateExternalUrl(newUrl);
                  if (result.isValid && result.validatedUrl != null) {
                    final config = ExternalUrlConfig(
                      url: result.validatedUrl!,
                      authType: globalAuthEnabled ? AuthType.none : authType,
                      username: globalAuthEnabled ? null : (authType == AuthType.basic ? username : null),
                      password: globalAuthEnabled ? null : (authType == AuthType.basic ? password : null),
                    );
                    ref
                        .read(externalNetworkUrlConfigsProvider.notifier)
                        .updateExternalUrl(index, config);
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
      ),
    );
  }

  void _showAddLocalNetworkDialog(BuildContext context, WidgetRef ref) {
    String wifiName = '';
    String serverUrl = '';
    AuthType authType = AuthType.none;
    String username = '';
    String password = '';
    
    final globalAuthEnabled = ref.read(globalAuthenticationEnabledProvider) ?? false;
    
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(context.l10n.addLocalNetwork),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: context.l10n.wifiNetworkName,
                    hintText: context.l10n.wifiNetworkNameHint,
                  ),
                  onChanged: (value) => wifiName = value,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: context.l10n.serverUrl,
                    hintText: context.l10n.serverUrlHint,
                  ),
                  onChanged: (value) => serverUrl = value,
                ),
                if (!globalAuthEnabled) ...[
                  const SizedBox(height: 16),
                  DropdownButtonFormField<AuthType>(
                    decoration: InputDecoration(
                      labelText: context.l10n.authenticationType,
                    ),
                    value: authType,
                    items: AuthType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type.toLocale(context)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        authType = value ?? AuthType.none;
                      });
                    },
                  ),
                  if (authType == AuthType.basic) ...[
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: context.l10n.username,
                      ),
                      onChanged: (value) => username = value,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: context.l10n.password,
                      ),
                      obscureText: true,
                      onChanged: (value) => password = value,
                    ),
                  ],
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.cancel),
            ),
            TextButton(
              onPressed: () {
                if (wifiName.isNotEmpty && serverUrl.isNotEmpty) {
                  final config = LocalNetworkConfig(
                    wifiName: wifiName,
                    serverUrl: serverUrl,
                    authType: globalAuthEnabled ? AuthType.none : authType,
                    username: globalAuthEnabled ? null : (authType == AuthType.basic ? username : null),
                    password: globalAuthEnabled ? null : (authType == AuthType.basic ? password : null),
                  );
                  ref
                      .read(localNetworkConfigsProvider.notifier)
                      .addLocalNetwork(config);
                  Navigator.of(context).pop();
                }
              },
              child: Text(context.l10n.add),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditLocalNetworkDialog(
      BuildContext context, WidgetRef ref, int index, LocalNetworkConfig currentConfig) {
    String wifiName = currentConfig.wifiName;
    String serverUrl = currentConfig.serverUrl;
    AuthType authType = currentConfig.authType;
    String username = currentConfig.username ?? '';
    String password = currentConfig.password ?? '';
    
    final globalAuthEnabled = ref.read(globalAuthenticationEnabledProvider) ?? false;
    
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(context.l10n.editLocalNetwork),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: context.l10n.wifiNetworkName,
                    hintText: context.l10n.wifiNetworkNameHint,
                  ),
                  controller: TextEditingController(text: currentConfig.wifiName),
                  onChanged: (value) => wifiName = value,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: context.l10n.serverUrl,
                    hintText: context.l10n.serverUrlHint,
                  ),
                  controller: TextEditingController(text: currentConfig.serverUrl),
                  onChanged: (value) => serverUrl = value,
                ),
                if (!globalAuthEnabled) ...[
                  const SizedBox(height: 16),
                  DropdownButtonFormField<AuthType>(
                    decoration: InputDecoration(
                      labelText: context.l10n.authenticationType,
                    ),
                    value: authType,
                    items: AuthType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type.toLocale(context)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        authType = value ?? AuthType.none;
                      });
                    },
                  ),
                  if (authType == AuthType.basic) ...[
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: context.l10n.username,
                      ),
                      controller: TextEditingController(text: username),
                      onChanged: (value) => username = value,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: context.l10n.password,
                      ),
                      controller: TextEditingController(text: password),
                      obscureText: true,
                      onChanged: (value) => password = value,
                    ),
                  ],
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.l10n.cancel),
            ),
            TextButton(
              onPressed: () {
                if (wifiName.isNotEmpty && serverUrl.isNotEmpty) {
                  final config = LocalNetworkConfig(
                    wifiName: wifiName,
                    serverUrl: serverUrl,
                    authType: globalAuthEnabled ? AuthType.none : authType,
                    username: globalAuthEnabled ? null : (authType == AuthType.basic ? username : null),
                    password: globalAuthEnabled ? null : (authType == AuthType.basic ? password : null),
                  );
                  ref
                      .read(localNetworkConfigsProvider.notifier)
                      .updateLocalNetwork(index, config);
                  Navigator.of(context).pop();
                }
              },
              child: Text(context.l10n.save),
            ),
          ],
        ),
      ),
    );
  }
}
