// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/enum.dart';

part 'external_url_config.freezed.dart';
part 'external_url_config.g.dart';

@freezed
class ExternalUrlConfig with _$ExternalUrlConfig {
  const factory ExternalUrlConfig({
    required String url,
    @Default(AuthType.none) AuthType authType,
    String? username,
    String? password,
  }) = _ExternalUrlConfig;

  factory ExternalUrlConfig.fromJson(Map<String, dynamic> json) =>
      _$ExternalUrlConfigFromJson(json);
}
