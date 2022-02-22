import 'dart:convert';

class About {
  final String name;
  final String version;
  final String revision;
  final String buildType;
  final int buildTime;
  final String github;
  final String discord;
  About({
    this.name = "",
    this.version = "",
    this.revision = "",
    this.buildType = "",
    this.buildTime = 0,
    this.github = "",
    this.discord = "",
  });

  About copyWith({
    String? name,
    String? version,
    String? revision,
    String? buildType,
    int? buildTime,
    String? github,
    String? discord,
  }) {
    return About(
      name: name ?? this.name,
      version: version ?? this.version,
      revision: revision ?? this.revision,
      buildType: buildType ?? this.buildType,
      buildTime: buildTime ?? this.buildTime,
      github: github ?? this.github,
      discord: discord ?? this.discord,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'version': version,
      'revision': revision,
      'buildType': buildType,
      'buildTime': buildTime,
      'github': github,
      'discord': discord,
    };
  }

  factory About.fromMap(Map<String, dynamic> map) {
    return About(
      name: map['name'] ?? '',
      version: map['version'] ?? '',
      revision: map['revision'] ?? '',
      buildType: map['buildType'] ?? '',
      buildTime: map['buildTime']?.toInt() ?? 0,
      github: map['github'] ?? '',
      discord: map['discord'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory About.fromJson(String source) => About.fromMap(json.decode(source));

  @override
  String toString() {
    return 'About(name: $name, version: $version, revision: $revision,'
        ' buildType: $buildType, buildTime: $buildTime,'
        ' github: $github, discord: $discord)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is About &&
        other.name == name &&
        other.version == version &&
        other.revision == revision &&
        other.buildType == buildType &&
        other.buildTime == buildTime &&
        other.github == github &&
        other.discord == discord;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        version.hashCode ^
        revision.hashCode ^
        buildType.hashCode ^
        buildTime.hashCode ^
        github.hashCode ^
        discord.hashCode;
  }
}
