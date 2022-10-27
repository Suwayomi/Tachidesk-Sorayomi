// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../constants/db_keys.dart';
import '../../../i18n/locale_keys.g.dart';
import '../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../utils/network/sembast/sembast_client.dart';
import '../../../widgets/pop_button.dart';
import '../data/local_settings_repository.dart';

// 🐦 Flutter imports:

// 📦 Package imports:

// 🌎 Project imports:

final serverUrlProvider = Provider.autoDispose<LocalSettingsRepository<String>>(
  (ref) => LocalSettingsRepository<String>(
    ref.watch(settingsLocalProvider),
    DBKeys.serverUrl,
  ),
);

final serverUrlStreamProvider = StreamProvider.autoDispose((ref) =>
    ref.watch(serverUrlProvider).getStream().map((event) => event?.toString()));

class ServerUrlTile extends HookConsumerWidget {
  const ServerUrlTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverUrl = ref.watch(serverUrlStreamProvider);
    return ListTile(
      leading: const Icon(Icons.computer_rounded),
      title: Text(LocaleKeys.serverSettingsScreen_url.tr()),
      subtitle: (serverUrl.hasValue) ? Text(serverUrl.value!) : null,
      onTap: () => showDialog(
        context: context,
        builder: (context) => ServerUrlField(initialUrl: serverUrl.valueOrNull),
      ),
    );
  }
}

class ServerUrlField extends HookConsumerWidget {
  const ServerUrlField({
    this.initialUrl,
    super.key,
  });
  final String? initialUrl;

  void _update(String url, WidgetRef ref, BuildContext context) =>
      ref.read(serverUrlProvider).update(url).then((value) => context.navPop());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: initialUrl);
    return AlertDialog(
      title: Text(LocaleKeys.serverSettingsScreen_url.tr()),
      content: TextField(
        autofocus: true,
        controller: controller,
        onSubmitted: (value) => _update(controller.text, ref, context),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: (LocaleKeys.serverSettingsScreen_hintText.tr()),
        ),
      ),
      actions: [
        const PopButton(),
        ElevatedButton(
          onPressed: () => _update(controller.text, ref, context),
          child: Text(LocaleKeys.common_save.tr()),
        ),
      ],
    );
  }
}
