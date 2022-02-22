import 'dart:convert';

class Category {
  int? id;
  String? name;
  int? order;
  bool? defaultCategory;
  Category({
    this.id,
    this.name,
    this.order,
    this.defaultCategory,
  });

  Category copyWith({
    int? id,
    String? name,
    int? order,
    bool? defaultCategory,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      defaultCategory: defaultCategory ?? this.defaultCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'order': order,
      'default': defaultCategory,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt(),
      name: map['name'],
      order: map['order']?.toInt(),
      defaultCategory: map['default'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(id: $id, name: $name,'
        ' order: $order, default: $defaultCategory)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        other.name == name &&
        other.order == order &&
        other.defaultCategory == defaultCategory;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        order.hashCode ^
        defaultCategory.hashCode;
  }
}
