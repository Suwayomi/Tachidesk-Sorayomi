// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/language_list.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../widgets/pop_button.dart';
import '../../domain/language/language_model.dart';
import 'controller/source_controller.dart';

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
