/// TimeoutSettings constant values
/// Values are stored in milliseconds.
class TimeoutConstants {
  // Server request timeout
  static const int requestTimeoutDefaultMs = 5000;
  static const int requestTimeoutMinMs = 1000;
  static const int requestTimeoutMaxMs = 30000;

  // Auto-refresh retry delay
  static const int autoRefreshRetryDelayDefaultMs = 1000;
  static const int autoRefreshRetryDelayMinMs = 1000;
  static const int autoRefreshRetryDelayMaxMs = 10000;

  // Helper getters in seconds
  static int get requestTimeoutDefaultSeconds =>
      requestTimeoutDefaultMs ~/ 1000;
  static int get requestTimeoutMinSeconds => requestTimeoutMinMs ~/ 1000;
  static int get requestTimeoutMaxSeconds => requestTimeoutMaxMs ~/ 1000;

  static int get autoRefreshRetryDelayDefaultSeconds =>
      autoRefreshRetryDelayDefaultMs ~/ 1000;
  static int get autoRefreshRetryDelayMinSeconds =>
      autoRefreshRetryDelayMinMs ~/ 1000;
  static int get autoRefreshRetryDelayMaxSeconds =>
      autoRefreshRetryDelayMaxMs ~/ 1000;
}
