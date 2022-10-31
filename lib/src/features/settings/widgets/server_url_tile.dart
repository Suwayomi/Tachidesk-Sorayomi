// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';
import '../../../constants/db_keys.dart';
import '../../../i18n/locale_keys.g.dart';
import '../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../utils/storage/local/shared_preferences_client.dart';
import '../../../widgets/pop_button.dart';

part 'server_url_tile.g.dart';

@riverpod
class ServerUrl extends _$ServerUrl with SharedPreferenceClient<String> {
  @override
  String? build() {
    client = ref.watch(sharedPreferencesProvider);
    initial = DBKeys.serverUrl.initial;
    key = DBKeys.serverUrl.name;
    return get;
  }
}

class ServerUrlTile extends HookConsumerWidget {
  const ServerUrlTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverUrl = ref.watch(serverUrlProvider);
    return ListTile(
      leading: const Icon(Icons.computer_rounded),
      title: Text(LocaleKeys.serverSettingsScreen_url.tr()),
      subtitle: serverUrl.isNotBlank ? Text(serverUrl!) : null,
      onTap: () => showDialog(
        context: context,
        builder: (context) => ServerUrlField(initialUrl: serverUrl),
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

  void _update(String url, WidgetRef ref) =>
      ref.read(serverUrlProvider.notifier).update(url);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: initialUrl);
    return AlertDialog(
      title: Text(LocaleKeys.serverSettingsScreen_url.tr()),
      content: TextField(
        autofocus: true,
        controller: controller,
        onSubmitted: (value) {
          _update(controller.text, ref);
          context.navPop();
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: (LocaleKeys.serverSettingsScreen_hintText.tr()),
        ),
      ),
      actions: [
        const PopButton(),
        ElevatedButton(
          onPressed: () {
            _update(controller.text, ref);
            context.navPop();
          },
          child: Text(LocaleKeys.common_save.tr()),
        ),
      ],
    );
  }
}
