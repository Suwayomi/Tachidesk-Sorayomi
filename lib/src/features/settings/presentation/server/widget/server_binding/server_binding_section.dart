import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../utils/misc/app_utils.dart';
import '../../../../../../utils/misc/toast/toast.dart';
import '../../../../../../widgets/input_popup/domain/input_popup_type.dart';
import '../../../../../../widgets/input_popup/input_popup.dart';
import '../../../../../../widgets/section_title.dart';
import '../../../../controller/server_controller.dart';
import '../../../../domain/server_binding/server_binding.dart';
import '../../data/server_settings_repository.dart';

class ServerBindingSection extends ConsumerWidget {
  const ServerBindingSection({
    super.key,
    required this.serverBindingDto,
  });
  final ServerBindingDto serverBindingDto;
  @override
  Widget build(context, ref) {
    final repository = ref.watch(serverSettingsRepositoryProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: context.l10n.serverBindings),
        InputPopup(
          title: context.l10n.ip,
          leading: const Icon(Icons.computer_rounded),
          type: InputPopupType.textField(hintText: context.l10n.ipHintText),
          subtitle: serverBindingDto.ip,
          value: serverBindingDto.ip,
          onChange: (newIp) async {
            final value = await AppUtils.guard(
                () => repository.updateIpAddress(newIp),
                ref.read(toastProvider));
            if (value != null) {
              ref.watch(settingsProvider.notifier).updateState(value);
            }
          },
        ),
        InputPopup(
          title: context.l10n.serverPort,
          subtitle: serverBindingDto.port.toString(),
          leading: const Icon(Icons.dns_rounded),
          value: serverBindingDto.port.toString(),
          onChange: (port) async {
            final newPort = int.tryParse(port);
            if (newPort != null) {
              final value = await AppUtils.guard(
                  () => repository.updatePort(newPort),
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
      ],
    );
  }
}
