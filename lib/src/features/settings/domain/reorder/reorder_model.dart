import 'package:freezed_annotation/freezed_annotation.dart';

part 'reorder_model.freezed.dart';
part 'reorder_model.g.dart';

@freezed
class Reorder with _$Reorder {
  factory Reorder({
    String? from,
    String? to,
  }) = _Reorder;

  factory Reorder.fromJson(Map<String, dynamic> json) =>
      _$ReorderFromJson(json);
}
