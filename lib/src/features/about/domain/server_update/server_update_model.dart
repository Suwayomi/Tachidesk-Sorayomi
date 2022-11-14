// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_update_model.freezed.dart';
part 'server_update_model.g.dart';

@freezed
class ServerUpdate with _$ServerUpdate {
  factory ServerUpdate({
    String? channel,
    String? tag,
    String? url,
  }) = _ServerUpdate;

  factory ServerUpdate.fromJson(Map<String, dynamic> json) =>
      _$ServerUpdateFromJson(json);
}
