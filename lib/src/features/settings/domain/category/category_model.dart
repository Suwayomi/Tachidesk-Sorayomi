// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class Category with _$Category {
  factory Category({
    int? id,
    String? name,
    int? order,
    @JsonKey(name: "default") bool? defaultCategory,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
