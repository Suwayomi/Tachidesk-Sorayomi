import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_popup_type.freezed.dart';

@freezed
sealed class InputPopupType with _$InputPopupType {
  const factory InputPopupType.textField({
    String? hintText,
  }) = TextFieldPopup;
  const factory InputPopupType.password({
    String? hintText,
  }) = PasswordPopup;
  const factory InputPopupType.numberPicker({
    required int min,
    required int max,
  }) = NumberPickerPopup;
  const factory InputPopupType.numberSlider({
    required int min,
    required int max,
  }) = NumberSliderPopup;
}
