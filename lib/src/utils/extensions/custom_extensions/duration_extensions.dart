extension DurationExt on Duration {
  String get formatToMinSec {
    List<String> min = toString().split('.').first.split(":");
    return "${min[1]}:${min[2]}";
  }
}
