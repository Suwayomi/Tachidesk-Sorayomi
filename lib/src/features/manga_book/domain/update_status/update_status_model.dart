// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../manga/manga_model.dart';

part 'update_status_model.freezed.dart';
part 'update_status_model.g.dart';

@freezed
class UpdateStatus with _$UpdateStatus {
  UpdateStatus._();
  factory UpdateStatus({
    @JsonKey(name: "PENDING") List<Manga>? pending,
    @JsonKey(name: "RUNNING") List<Manga>? running,
    @JsonKey(name: "COMPLETE") List<Manga>? completed,
    @JsonKey(name: "FAILED") List<Manga>? failed,
  }) = _UpdateStatus;

  int get total =>
      (pending?.length ?? 0) +
      (running?.length ?? 0) +
      (completed?.length ?? 0) +
      (failed?.length ?? 0);

  int get updateChecked => (completed?.length ?? 0) + (failed?.length ?? 0);

  bool get isUpdateCompleted => total == updateChecked;

  bool get showUpdateStatus => (total).isGreaterThan(0) && !(isUpdateCompleted);

  factory UpdateStatus.fromJson(Map<String, dynamic> json) =>
      _$UpdateStatusFromJson(json);
}
