import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../utils/extensions/custom_extensions.dart';
import '../../utils/misc/app_utils.dart';
import '../number_picker/number_picker.dart';
import '../popup_widgets/slider_popup.dart';
import 'domain/input_popup_type.dart';

class InputPopup extends StatelessWidget {
  const InputPopup({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onChange,
    required this.type,
    this.value,
  });
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final String? subtitle;
  final ValueChanged<String>? onChange;
  final InputPopupType type;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      trailing: trailing,
      title: Text(title),
      subtitle: (subtitle).isNotBlank ? Text(subtitle!) : null,
      onTap: AppUtils.returnIf(
        onChange != null,
        () => showDialog(
          context: context,
          builder: (context) => InputDialog(
            title: title,
            onChange: onChange!,
            value: value,
            type: type,
          ),
        ),
      ),
    );
  }
}

class InputDialog extends HookWidget {
  const InputDialog({
    super.key,
    required this.title,
    required this.onChange,
    required this.type,
    this.value,
  });

  final String title;
  final ValueChanged<String> onChange;
  final InputPopupType type;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: value.ifBlank());
    final isObscured = useState(true);
    useListenable(controller);
    useEffect(() {
      if (value.isNotBlank) {
        controller.text = value!;
      }
      return null;
    }, [value]);
    return AlertDialog(
      title: Text(title),
      content: switch (type) {
        TextFieldPopup(hintText: String? hintText) => TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
            ),
          ),
        PasswordPopup(hintText: String? hintText) => TextField(
            controller: controller,
            autofocus: true,
            obscureText: isObscured.value,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: isObscured.value
                    ? const Icon(Icons.visibility_rounded)
                    : const Icon(Icons.visibility_off_rounded),
                onPressed: () => isObscured.value = !isObscured.value,
              ),
            ),
          ),
        NumberPickerPopup(min: int min, max: int max) => NumberPicker(
            max: max,
            min: min,
            onChanged: (value) => controller.text = value.toString(),
            value: int.tryParse(controller.text) ??
                int.tryParse(value.ifBlank()) ??
                min,
          ),
        NumberSliderPopup(min: int min, max: int max) => NumberSlider(
            min: min,
            max: max,
            onChanged: (value) => controller.text = value.toString(),
            value: int.tryParse(controller.text) ??
                int.tryParse(value.ifBlank()) ??
                min,
          ),
      },
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(context.l10n.cancel),
        ),
        TextButton(
          onPressed: () {
            onChange(controller.text);
            Navigator.pop(context);
          },
          child: Text(context.l10n.save),
        ),
      ],
    );
  }
}
