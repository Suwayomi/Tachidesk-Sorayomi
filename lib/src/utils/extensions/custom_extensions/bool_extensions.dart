extension BoolExtensions on bool? {
  bool ifNull([bool? alternative]) => this ?? alternative ?? false;
}
