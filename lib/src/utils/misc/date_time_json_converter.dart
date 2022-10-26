class DateTimeJsonConverter {
  static DateTime? fromJson(int? time) =>
      time != null ? DateTime.fromMillisecondsSinceEpoch(time) : null;
  static int? toJson(DateTime? time) => time?.millisecondsSinceEpoch;
}
