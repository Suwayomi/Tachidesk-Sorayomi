// 🎯 Dart imports:
import 'dart:math';

// 🎯 Dart imports:

extension StringExtensions on String? {
  bool get isNull => this == null;

  bool get isBlank => isNull || this!.isEmpty;

  bool get isNotBlank => !isBlank;

  double? tryParse() => isNull ? null : double.tryParse(this!);
  bool hasMatch(String pattern) =>
      (isNull) ? false : RegExp(pattern).hasMatch(this!);

  String? get capitalize {
    if (isNull) return null;
    if (this!.isEmpty) return this;
    return this!.split(' ').map((e) => e.capitalizeFirst).join(' ');
  }

  String? get capitalizeFirst {
    if (isNull) return null;
    if (this!.isEmpty) return this;
    return this![0].toUpperCase() + this!.substring(1).toLowerCase();
  }

  /// Converts "dattatreya reddy" to "DR"
  String? nameToLetters({int maxLength = 2}) {
    if (isNull) return null;
    return this!
        .split(" ")
        .take(maxLength)
        .map((e) => e.isEmpty ? "" : e[0].toUpperCase())
        .join();
  }

  String get incrementZeroPaddedInt {
    if (isNull) return "1";
    final valLen = this!.length;
    final newVal = (int.tryParse(this!) ?? 0) + 1;
    final noOfZeros = max(valLen - (newVal.toString()).length, 0);
    return "0" * noOfZeros + newVal.toString();
  }

  /// Checks if this is phone number.
  bool get isPhoneNumber {
    if (isNull) return false;
    if (this!.length != 10) return false;
    return hasMatch(r'^[0-9]{10}$');
  }

  /// Checks if this is email.
  bool get isEmail {
    if (isNull) return false;
    return this!.hasMatch(
        r'^(([^<>[\]\\.,;:\s@\"]+(\.[^<>[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  }

  bool query([String? query]) {
    if (isNull) return false;
    if (query == null) return true;
    return this!.toLowerCase().contains(query.toLowerCase());
  }

  String? get toCamelCase {
    if (isBlank) return null;
    List<String> separatedWords =
        this!.split(RegExp(r'[!@#<>?":`~;[\]\\|=+)(*&^%-\s_]+'));
    return separatedWords.fold<String>(
      "",
      (value, word) =>
          value + word[0].toUpperCase() + word.substring(1).toLowerCase(),
    );
  }

  String? get toStartCase {
    if (isBlank) return null;
    final separatedWords =
        this!.split(RegExp(r'[!@#<>?":`~;[\]\\|=+)(*&^%-\s_]+'));
    separatedWords[0] = separatedWords[0].capitalizeFirst!;
    return separatedWords.reduce((value, e) => "$value ${e.capitalizeFirst!}");
  }

  String? get last10Digits {
    if (isBlank) return null;
    return this!.length > 10 ? this!.substring(this!.length - 10) : this;
  }
}
