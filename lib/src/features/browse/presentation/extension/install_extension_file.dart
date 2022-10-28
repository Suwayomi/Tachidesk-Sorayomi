// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/features/browse/data/extension_repository.dart';
import 'package:tachidesk_sorayomi/src/features/browse/presentation/extension/controller/extension_controller.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/async_value_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/misc/toast.dart';

class InstallExtensionFile extends ConsumerWidget {
  const InstallExtensionFile({Key? key}) : super(key: key);

  void extensionFilePicker(WidgetRef ref, BuildContext context) async {
    final toast = ref.read(toastProvider(context));
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['apk'],
    );
    if ((file?.files).isNotBlank) {
      toast.show(LocaleKeys.extensionScreen_installFile_title.tr());
    }
    final result = (await AsyncValue.guard(() => ref
        .read(extensionRepositoryProvider)
        .installExtensionFile(file: file?.files.single)))
      ..showToastOnError(toast);
    result.maybeWhen(
      data: (data) {
        ref.read(extensionControllerProvider.notifier).loadExtensions();
        toast.instantShow(
            LocaleKeys.extensionScreen_extensionInstalled_title.tr());
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.add_rounded),
      onPressed: () => extensionFilePicker(ref, context),
    );
  }
}
