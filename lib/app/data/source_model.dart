import 'dart:convert';

class Source {
  String? displayName;
  String? iconUrl;
  String? id;
  bool? isConfigurable;
  bool? isNsfw;
  String? lang;
  String? name;
  bool? supportsLatest;
  Source({
    this.displayName,
    this.iconUrl,
    this.id,
    this.isConfigurable,
    this.isNsfw,
    this.lang,
    this.name,
    this.supportsLatest,
  });

  Source copyWith({
    String? displayName,
    String? iconUrl,
    String? id,
    bool? isConfigurable,
    bool? isNsfw,
    String? lang,
    String? name,
    bool? supportsLatest,
  }) {
    return Source(
      displayName: displayName ?? this.displayName,
      iconUrl: iconUrl ?? this.iconUrl,
      id: id ?? this.id,
      isConfigurable: isConfigurable ?? this.isConfigurable,
      isNsfw: isNsfw ?? this.isNsfw,
      lang: lang ?? this.lang,
      name: name ?? this.name,
      supportsLatest: supportsLatest ?? this.supportsLatest,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'iconUrl': iconUrl,
      'id': id,
      'isConfigurable': isConfigurable,
      'isNsfw': isNsfw,
      'lang': lang,
      'name': name,
      'supportsLatest': supportsLatest,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      displayName: map['displayName'],
      iconUrl: map['iconUrl'],
      id: map['id'],
      isConfigurable: map['isConfigurable'],
      isNsfw: map['isNsfw'],
      lang: map['lang'],
      name: map['name'],
      supportsLatest: map['supportsLatest'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Source(displayName: $displayName, iconUrl: $iconUrl,'
        ' id: $id, isConfigurable: $isConfigurable, isNsfw: $isNsfw,'
        ' lang: $lang, name: $name, supportsLatest: $supportsLatest)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Source &&
        other.displayName == displayName &&
        other.iconUrl == iconUrl &&
        other.id == id &&
        other.isConfigurable == isConfigurable &&
        other.isNsfw == isNsfw &&
        other.lang == lang &&
        other.name == name &&
        other.supportsLatest == supportsLatest;
  }

  @override
  int get hashCode {
    return displayName.hashCode ^
        iconUrl.hashCode ^
        id.hashCode ^
        isConfigurable.hashCode ^
        isNsfw.hashCode ^
        lang.hashCode ^
        name.hashCode ^
        supportsLatest.hashCode;
  }
}
