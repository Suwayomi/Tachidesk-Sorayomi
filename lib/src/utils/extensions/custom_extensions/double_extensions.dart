extension DoubleExtensions on double? {
  bool liesBetween({double lower = 0, double upper = 1}) =>
      this != null ? this! >= lower && this! <= upper : false;
  bool get isZero => this != null ? this! == 0 : true;
  bool get isNotZero => !isZero;
}
