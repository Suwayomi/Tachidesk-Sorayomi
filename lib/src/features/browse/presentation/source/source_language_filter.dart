// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/constants/language_list.dart';
import 'package:tachidesk_sorayomi/src/features/browse/domain/language/language_model.dart';
import 'package:tachidesk_sorayomi/src/features/browse/presentation/source/controller/source_controller.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';
import 'package:tachidesk_sorayomi/src/widgets/pop_button.dart';

class SourceLanguageFilter extends ConsumerWidget {
  const SourceLanguageFilter({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCodes = [...(ref.watch(sourceMapProvider)).keys]
      ..remove("localsourcelang")
      ..remove("lastUsed");
    final enabledLanguages = ref.watch(sourceLanguageFilterProvider);
    return AlertDialog(
      title: Text(LocaleKeys.languages.tr()),
      content: SizedBox(
        height: context.heightScale(scale: .5),
        width: context.widthScale(scale: context.isSmallTablet ? .5 : .8),
        child: ListView.builder(
          itemCount: languageCodes.length,
          itemBuilder: (context, index) {
            final Language? language = languageMap[languageCodes[index]];
            final enabledLanguagesIndex =
                enabledLanguages?.indexOf(languageCodes[index]);
            return SwitchListTile(
              value: enabledLanguagesIndex != -1,
              onChanged: (value) {
                if (value) {
                  ref.read(sourceLanguageFilterProvider.notifier).update(
                        {...?enabledLanguages, languageCodes[index]}.toList(),
                      );
                } else {
                  if (!(enabledLanguagesIndex?.isNegative ?? true)) {
                    ref.read(sourceLanguageFilterProvider.notifier).update(
                          [...?enabledLanguages]
                            ..removeAt(enabledLanguagesIndex!),
                        );
                  }
                }
              },
              title: Text(
                language?.nativeName ?? language?.name ?? languageCodes[index],
              ),
            );
          },
        ),
      ),
      actions: const [PopButton()],
    );
  }
}
