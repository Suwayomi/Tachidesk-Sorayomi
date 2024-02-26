import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/restore_state.dart';

part 'restore_status.freezed.dart';
part 'restore_status.g.dart';

@freezed
class RestoreStatus with _$RestoreStatus {
  factory RestoreStatus({
    int? mangaProgress,
    RestoreState? state,
    int? totalManga,
  }) = _RestoreStatus;

  factory RestoreStatus.fromJson(Map<String, dynamic> json) =>
      _$RestoreStatusFromJson(json);
}
