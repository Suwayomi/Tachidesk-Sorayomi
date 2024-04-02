import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../utils/misc/app_utils.dart';
import '../../../../../../utils/misc/toast/toast.dart';
import '../../../../../../widgets/input_popup/domain/input_popup_type.dart';
import '../../../../../../widgets/input_popup/input_popup.dart';
import '../../../../../../widgets/section_title.dart';
import '../../../../controller/server_controller.dart';
import '../../../../domain/socks_proxy/socks_proxy.dart';
import '../../data/server_settings_repository.dart';

class SocksProxySection extends ConsumerWidget {
  const SocksProxySection({
    super.key,
    required this.socksProxyDto,
  });
  final SocksProxyDto socksProxyDto;
  @override
  Widget build(context, ref) {
    final repository = ref.watch(serverSettingsRepositoryProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: context.l10n.socksProxy),
        SwitchListTile(
          title: Text(context.l10n.enableSocksProxy),
          value: socksProxyDto.socksProxyEnabled,
          onChanged: (isEnabled) async {
            final value = await AppUtils.guard(
                () => repository.toggleSocksProxy(isEnabled),
                ref.read(toastProvider));
            if (value != null) {
              ref.read(settingsProvider.notifier).updateState(value);
            }
          },
        ),
        if (socksProxyDto.socksProxyEnabled) ...[
          InputPopup(
            title: context.l10n.socksVersion,
            subtitle: socksProxyDto.socksProxyVersion.toString(),
            value: socksProxyDto.socksProxyVersion.toString(),
            onChange: (version) async {
              final newVersion = int.tryParse(version);
              if (newVersion != null) {
                final value = await AppUtils.guard(
                    () => repository.updateSocksVersion(newVersion),
                    ref.read(toastProvider));
                if (value != null) {
                  ref.watch(settingsProvider.notifier).updateState(value);
                }
              } else {
                ref.read(toastProvider)?.showError(
                    context.l10n.invalidProp(context.l10n.socksVersion));
              }
            },
            type: const InputPopupType.numberPicker(min: 4, max: 5),
          ),
          InputPopup(
            title: context.l10n.socksHost,
            type: InputPopupType.textField(
                hintText: context.l10n.enterProp(context.l10n.socksHost)),
            subtitle: socksProxyDto.socksProxyHost,
            value: socksProxyDto.socksProxyHost,
            onChange: (newValue) async {
              final result = await AppUtils.guard(
                  () => repository.updateSocksHost(newValue),
                  ref.read(toastProvider));
              if (result != null) {
                ref.watch(settingsProvider.notifier).updateState(result);
              }
            },
          ),
          InputPopup(
            title: context.l10n.socksPort,
            subtitle: socksProxyDto.socksProxyPort.toString(),
            value: socksProxyDto.socksProxyPort.toString(),
            onChange: (port) async {
              final newPort = int.tryParse(port);
              if (newPort != null) {
                final value = await AppUtils.guard(
                    () => repository.updateSocksPort(newPort.toString()),
                    ref.read(toastProvider));
                if (value != null) {
                  ref.watch(settingsProvider.notifier).updateState(value);
                }
              } else {
                ref.read(toastProvider)?.showError(context.l10n.invalidPort);
              }
            },
            type: const InputPopupType.numberPicker(min: 0, max: 65535),
          ),
          InputPopup(
            title: context.l10n.socksUserName,
            type: InputPopupType.textField(
                hintText: context.l10n.enterProp(context.l10n.socksUserName)),
            subtitle: socksProxyDto.socksProxyUsername,
            value: socksProxyDto.socksProxyUsername,
            onChange: (newValue) async {
              final result = await AppUtils.guard(
                  () => repository.updateSocksUserName(newValue),
                  ref.read(toastProvider));
              if (result != null) {
                ref.watch(settingsProvider.notifier).updateState(result);
              }
            },
          ),
          InputPopup(
            title: context.l10n.socksPassword,
            type: InputPopupType.password(
              hintText: context.l10n.enterProp(context.l10n.socksPassword),
            ),
            value: socksProxyDto.socksProxyPassword,
            onChange: (newValue) async {
              final result = await AppUtils.guard(
                  () => repository.updateSocksPassword(newValue),
                  ref.read(toastProvider));
              if (result != null) {
                ref.watch(settingsProvider.notifier).updateState(result);
              }
            },
          ),
        ],
      ],
    );
  }
}
