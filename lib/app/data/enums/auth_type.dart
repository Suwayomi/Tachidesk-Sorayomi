enum AuthType {
  none,
  basic,
}

AuthType authTypeFromString(String? value) {
  return AuthType.values.firstWhere(
    (element) => element.name == value,
    orElse: () => AuthType.none,
  );
}
