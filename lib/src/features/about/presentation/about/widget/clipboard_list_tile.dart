import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';

import 'package:tachidesk_sorayomi/src/utils/misc/toast.dart';

class ClipboardListTile extends ConsumerWidget {
  const ClipboardListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String? subtitle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Toast toast = ref.watch(toastProvider(context));
    return ListTile(
      title: Text(title),
      subtitle: subtitle.isNotBlank ? Text(subtitle!) : null,
      onTap: subtitle.isNotBlank
          ? () {
              final msg = "$title: $subtitle";
              Clipboard.setData(
                ClipboardData(text: msg),
              );
              toast.close();
              toast.show(
                LocaleKeys.common_copyMsg.tr(
                  namedArgs: {"msg": msg},
                ),
              );
            }
          : null,
    );
  }
}
