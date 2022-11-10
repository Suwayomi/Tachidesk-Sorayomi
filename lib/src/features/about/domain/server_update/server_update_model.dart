// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_update_model.freezed.dart';
part 'server_update_model.g.dart';

@freezed
class ServerUpdate with _$ServerUpdate {
  factory ServerUpdate(String? channel, String? tag, String? url) =
      _ServerUpdate;

  factory ServerUpdate.fromJson(Map<String, dynamic> json) =>
      _$ServerUpdateFromJson(json);
}
