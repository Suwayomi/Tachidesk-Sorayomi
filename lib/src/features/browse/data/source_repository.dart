import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:tachidesk_sorayomi/src/utils/network/dio/dio_client.dart';

import '../../../constants/endpoints.dart';
import '../../../global_providers/package_info_provider.dart';
import '../domain/source/source_model.dart';

class SourceRepository {
  final DioClient dioClient;

  SourceRepository(this.dioClient);

  Future<List<Source>?> getSourceList({CancelToken? cancelToken}) async =>
      (await dioClient.get<List<Source>, Source>(
        SourceUrl.sourceList,
        decoder: (e) =>
            e is Map<String, dynamic> ? Source.fromJson(e) : Source(),
        cancelToken: cancelToken,
      ))
          .data;
}

final sourceRepositoryProvider = Provider<SourceRepository>(
  (ref) => SourceRepository(ref.watch(dioClientProvider)),
);
