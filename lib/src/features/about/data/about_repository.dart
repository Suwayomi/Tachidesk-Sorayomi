// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../constants/endpoints.dart';
import '../../../constants/urls.dart';
import '../../../global_providers/global_providers.dart';
import '../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../utils/storage/dio/dio_client.dart';
import '../domain/about/about_model.dart';
import '../domain/server_update/server_update_model.dart';
import '../presentation/about/controllers/about_controller.dart';

part 'about_repository.g.dart';

class AboutRepository {
  final DioClient dioClient;
  final PackageInfo packageInfo;
  AboutRepository({
    required this.dioClient,
    required this.packageInfo,
  });

  Future<About?> getAbout({CancelToken? cancelToken}) async {
    return (await dioClient.get<About, About?>(
      SettingsUrl.about,
      decoder: (e) => e is Map<String, dynamic> ? About.fromJson(e) : null,
      cancelToken: cancelToken,
    ))
        .data;
  }

  Future<List<ServerUpdate>?> checkServerUpdate() async {
    return (await dioClient.get<List<ServerUpdate>, ServerUpdate>(
      SettingsUrl.checkServerUpdate,
      decoder: (e) =>
          e is Map<String, dynamic> ? ServerUpdate.fromJson(e) : ServerUpdate(),
    ))
        .data;
  }

  Future<AsyncValue<Version?>> checkUpdate({CancelToken? cancelToken}) async {
    final gitResponse = await AsyncValue.guard<Map<String, dynamic>?>(
      () async => (await dioClient.get(
        AppUrls.sorayomiLatestReleaseApiUrl.url,
        cancelToken: cancelToken,
      ))
          .data,
    );
    return gitResponse.copyWithData<Version?>(
      (data) {
        String? tag = data?["tag_name"];
        Version? latestReleaseBuildNumber =
            tag != null ? Version.parse(tag) : null;
        Version? packageBuildNumber = Version.parse(packageInfo.version);
        if (latestReleaseBuildNumber != null &&
            latestReleaseBuildNumber
                .compareTo(packageBuildNumber)
                .isGreaterThan(0)) {
          return latestReleaseBuildNumber;
        }
        return null;
      },
    );
  }
}

@riverpod
AboutRepository aboutRepository(ref) => AboutRepository(
      dioClient: ref.watch(dioClientKeyProvider),
      packageInfo: ref.watch(packageInfoProvider),
    );
