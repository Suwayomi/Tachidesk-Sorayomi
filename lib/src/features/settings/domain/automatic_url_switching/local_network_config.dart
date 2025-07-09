// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/enum.dart';

part 'local_network_config.freezed.dart';
part 'local_network_config.g.dart';

@freezed
class LocalNetworkConfig with _$LocalNetworkConfig {
  const factory LocalNetworkConfig({
    required String wifiName,
    required String serverUrl,
    @Default(AuthType.none) AuthType authType,
    String? username,
    String? password,
  }) = _LocalNetworkConfig;

  factory LocalNetworkConfig.fromJson(Map<String, dynamic> json) =>
      _$LocalNetworkConfigFromJson(json);
}
