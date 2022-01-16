import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'download_queue_value_model.dart';

class Downloads {
  List<DownloadQueueValue>? queue;
  String? status;
  Downloads({
    this.queue,
    this.status,
  });

  Downloads copyWith({
    List<DownloadQueueValue>? queue,
    String? status,
  }) {
    return Downloads(
      queue: queue ?? this.queue,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'queue': queue?.map((x) => x.toMap()).toList(),
      'status': status,
    };
  }

  factory Downloads.fromMap(Map<String, dynamic> map) {
    return Downloads(
      queue: map['queue'] != null
          ? List<DownloadQueueValue>.from(
              map['queue']?.map((x) => DownloadQueueValue.fromMap(x)))
          : null,
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Downloads.fromJson(String source) =>
      Downloads.fromMap(json.decode(source));

  @override
  String toString() => 'Downloads(queue: $queue, status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Downloads &&
        listEquals(other.queue, queue) &&
        other.status == status;
  }

  @override
  int get hashCode => queue.hashCode ^ status.hashCode;
}
