// Package imports:
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import '../../../constants/endpoints.dart';
import '../../../constants/urls.dart';
import '../../../global_providers/global_providers.dart';
import '../../../utils/storage/dio/dio_client.dart';
import '../domain/about/about_model.dart';

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

  Future<AsyncValue<Version?>> checkUpdate({CancelToken? cancelToken}) async {
    final gitResponse = await AsyncValue.guard<Map<String, dynamic>?>(
      () async => (await dioClient.get(
        AppUrls.sorayomiLatestReleaseApiUrl.url,
        cancelToken: cancelToken,
      ))
          .data,
    );
    return gitResponse.when<AsyncValue<Version?>>(
      data: (data) {
        String? tag = data?["tag_name"];
        Version? latestReleaseBuildNumber =
            tag != null ? Version.parse(tag) : null;
        Version? packageBuildNumber = Version.parse(packageInfo.version);
        if (latestReleaseBuildNumber != null &&
            packageBuildNumber.compareTo(latestReleaseBuildNumber) < 0) {
          return AsyncData(latestReleaseBuildNumber);
        }
        return const AsyncData(null);
      },
      error: AsyncValue.error,
      loading: AsyncValue.loading,
    );
  }
}

@riverpod
AboutRepository aboutRepository(ref) => AboutRepository(
      dioClient: ref.watch(dioClientKeyProvider),
      packageInfo: ref.watch(packageInfoProvider),
    );
