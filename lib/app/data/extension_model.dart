import 'dart:convert';

class Extension {
  String? apkName;
  bool? hasUpdate;
  String? iconUrl;
  bool? installed;
  bool? isNsfw;
  String? lang;
  String? name;
  bool? obsolete;
  String? pkgName;
  int? versionCode;
  String? versionName;
  Extension({
    this.apkName,
    this.hasUpdate,
    this.iconUrl,
    this.installed,
    this.isNsfw,
    this.lang,
    this.name,
    this.obsolete,
    this.pkgName,
    this.versionCode,
    this.versionName,
  });

  Extension copyWith({
    String? apkName,
    bool? hasUpdate,
    String? iconUrl,
    bool? installed,
    bool? isNsfw,
    String? lang,
    String? name,
    bool? obsolete,
    String? pkgName,
    int? versionCode,
    String? versionName,
  }) {
    return Extension(
      apkName: apkName ?? this.apkName,
      hasUpdate: hasUpdate ?? this.hasUpdate,
      iconUrl: iconUrl ?? this.iconUrl,
      installed: installed ?? this.installed,
      isNsfw: isNsfw ?? this.isNsfw,
      lang: lang ?? this.lang,
      name: name ?? this.name,
      obsolete: obsolete ?? this.obsolete,
      pkgName: pkgName ?? this.pkgName,
      versionCode: versionCode ?? this.versionCode,
      versionName: versionName ?? this.versionName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'apkName': apkName,
      'hasUpdate': hasUpdate,
      'iconUrl': iconUrl,
      'installed': installed,
      'isNsfw': isNsfw,
      'lang': lang,
      'name': name,
      'obsolete': obsolete,
      'pkgName': pkgName,
      'versionCode': versionCode,
      'versionName': versionName,
    };
  }

  factory Extension.fromMap(Map<String, dynamic> map) {
    return Extension(
      apkName: map['apkName'],
      hasUpdate: map['hasUpdate'],
      iconUrl: map['iconUrl'],
      installed: map['installed'],
      isNsfw: map['isNsfw'],
      lang: map['lang'],
      name: map['name'],
      obsolete: map['obsolete'],
      pkgName: map['pkgName'],
      versionCode: map['versionCode']?.toInt(),
      versionName: map['versionName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Extension.fromJson(Map<String, dynamic> source) => Extension.fromMap(source);

  @override
  String toString() {
    return 'Extension(apkName: $apkName, hasUpdate: $hasUpdate, iconUrl: $iconUrl, installed: $installed, isNsfw: $isNsfw, lang: $lang, name: $name, obsolete: $obsolete, pkgName: $pkgName, versionCode: $versionCode, versionName: $versionName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Extension &&
      other.apkName == apkName &&
      other.hasUpdate == hasUpdate &&
      other.iconUrl == iconUrl &&
      other.installed == installed &&
      other.isNsfw == isNsfw &&
      other.lang == lang &&
      other.name == name &&
      other.obsolete == obsolete &&
      other.pkgName == pkgName &&
      other.versionCode == versionCode &&
      other.versionName == versionName;
  }

  @override
  int get hashCode {
    return apkName.hashCode ^
      hasUpdate.hashCode ^
      iconUrl.hashCode ^
      installed.hashCode ^
      isNsfw.hashCode ^
      lang.hashCode ^
      name.hashCode ^
      obsolete.hashCode ^
      pkgName.hashCode ^
      versionCode.hashCode ^
      versionName.hashCode;
  }
}
