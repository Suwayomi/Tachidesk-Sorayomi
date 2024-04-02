import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../constants/urls.dart';
import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../utils/launch_url_in_web.dart';
import '../../../../../../utils/misc/app_utils.dart';
import '../../../../../../utils/misc/toast/toast.dart';
import '../../../../../../widgets/input_popup/domain/input_popup_type.dart';
import '../../../../../../widgets/input_popup/input_popup.dart';
import '../../../../../../widgets/section_title.dart';
import '../../../../controller/server_controller.dart';
import '../../../../domain/cloud_flare/cloud_flare.dart';
import '../../data/server_settings_repository.dart';

class CloudFlareSection extends ConsumerWidget {
  const CloudFlareSection({super.key, required this.cloudFlareDto});

  final CloudFlareDto cloudFlareDto;
  @override
  Widget build(context, ref) {
    final repository = ref.watch(serverSettingsRepositoryProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: context.l10n.cloudflareBypass),
        SwitchListTile(
          title: Row(children: [
            Text(context.l10n.flareSolverr),
            IconButton(
                iconSize: 18,
                onPressed: () => launchUrlInWeb(
                    context, AppUrls.flareSolverr.url, ref.read(toastProvider)),
                icon: const Icon(Icons.open_in_new_rounded))
          ]),
          value: cloudFlareDto.flareSolverrEnabled,
          subtitle: Text(context.l10n.openFlareSolverr),
          onChanged: (isEnabled) async {
            final value = await AppUtils.guard(
                () => repository.toggleFlareSolverr(isEnabled),
                ref.read(toastProvider));
            if (value != null) {
              ref.read(settingsProvider.notifier).updateState(value);
            }
          },
        ),
        if (cloudFlareDto.flareSolverrEnabled) ...[
          InputPopup(
            title: context.l10n.flareSolverrServerUrl,
            type: InputPopupType.textField(
                hintText:
                    context.l10n.enterProp(context.l10n.flareSolverrServerUrl)),
            subtitle: cloudFlareDto.flareSolverrUrl,
            value: cloudFlareDto.flareSolverrUrl,
            onChange: (newValue) async {
              final result = await AppUtils.guard(
                  () => repository.updateFlareSolverrUrl(newValue),
                  ref.read(toastProvider));
              if (result != null) {
                ref.watch(settingsProvider.notifier).updateState(result);
              }
            },
          ),
          InputPopup(
            title: context.l10n.flareSolverrRequestTimeout,
            value: cloudFlareDto.flareSolverrTimeout.toString(),
            subtitle: context.l10n.nSeconds(cloudFlareDto.flareSolverrTimeout),
            onChange: (value) async {
              final newValue = int.tryParse(value);
              if (newValue != null) {
                final result = await AppUtils.guard(
                    () => repository.updateFlareSolverrTimeout(newValue),
                    ref.read(toastProvider));
                if (result != null) {
                  ref.watch(settingsProvider.notifier).updateState(result);
                }
              } else {
                ref.read(toastProvider)?.showError(context.l10n
                    .invalidProp(context.l10n.flareSolverrRequestTimeout));
              }
            },
            type: const InputPopupType.numberSlider(min: 20, max: 300),
          ),
          InputPopup(
            title: context.l10n.flareSolverrSessionName,
            type: InputPopupType.textField(
                hintText: context.l10n
                    .enterProp(context.l10n.flareSolverrSessionName)),
            subtitle: cloudFlareDto.flareSolverrSessionName,
            value: cloudFlareDto.flareSolverrSessionName,
            onChange: (newValue) async {
              final result = await AppUtils.guard(
                  () => repository.updateFlareSolverrSessionName(newValue),
                  ref.read(toastProvider));
              if (result != null) {
                ref.watch(settingsProvider.notifier).updateState(result);
              }
            },
          ),
          InputPopup(
            title: context.l10n.flareSolverrSessionTTL,
            value: cloudFlareDto.flareSolverrSessionTtl.toString(),
            subtitle:
                context.l10n.nMinutes(cloudFlareDto.flareSolverrSessionTtl),
            onChange: (value) async {
              final newValue = int.tryParse(value);
              if (newValue != null) {
                final result = await AppUtils.guard(
                    () => repository.updateFlareSolverrSessionTtl(newValue),
                    ref.read(toastProvider));
                if (result != null) {
                  ref.watch(settingsProvider.notifier).updateState(result);
                }
              } else {
                ref.read(toastProvider)?.showError(context.l10n
                    .invalidProp(context.l10n.flareSolverrSessionTTL));
              }
            },
            type: const InputPopupType.numberSlider(min: 1, max: 60),
          ),
        ],
      ],
    );
  }
}
