import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/utils/network/dio/dio_base_client.dart';
import '../../../constants/enum.dart';
import '../../../global_providers/package_info_provider.dart';

typedef ResponseDecoderCallBack<DecoderType> = DecoderType Function(dynamic);

enum ComputeParameters { responseData, decoder }

class DioClient extends BaseDioClient {
  DioClient({required Dio dio, required this.ref}) : super(dio);
  ProviderRef<DioClient> ref;
  Future<Map<String, dynamic>?> get getAuth async {
    final AuthType authType =
        await ref.read(authTypeProvider).get() ?? AuthType.none;
    if (authType == AuthType.basic) {
      final String? basicToken = await ref.read(baseTokenProvider).get();
      return {"Authorization": basicToken};
    }
    return null;
  }

  @override
  Future<Response<ReturnType?>> get<ReturnType, DecoderType>(
    String url, {
    Map<String, dynamic>? queryParameters,
    ResponseDecoderCallBack<DecoderType>? decoder,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final auth = await getAuth;
    return super.get(
      url,
      queryParameters: queryParameters,
      decoder: decoder,
      options: (options ?? Options())
          .copyWith(headers: {...?options?.headers, ...?auth}),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<ReturnType?>> post<ReturnType, DecoderType>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    ResponseDecoderCallBack<DecoderType>? decoder,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final auth = await getAuth;
    return super.post(
      url,
      data: data,
      queryParameters: queryParameters,
      decoder: decoder,
      options: (options ?? Options())
          .copyWith(headers: {...?options?.headers, ...?auth}),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<ReturnType?>> patch<ReturnType, DecoderType>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    ResponseDecoderCallBack<DecoderType>? decoder,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final auth = await getAuth;
    return super.patch(
      url,
      data: data,
      queryParameters: queryParameters,
      decoder: decoder,
      options: (options ?? Options())
          .copyWith(headers: {...?options?.headers, ...?auth}),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<ReturnType?>?> put<ReturnType, DecoderType>(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    ResponseDecoderCallBack<DecoderType>? decoder,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final auth = await getAuth;
    return super.put(
      url,
      data: data,
      queryParameters: queryParameters,
      decoder: decoder,
      options: (options ?? Options())
          .copyWith(headers: {...?options?.headers, ...?auth}),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<ReturnType?>> delete<ReturnType, DecoderType>(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    ResponseDecoderCallBack<DecoderType>? decoder,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final auth = await getAuth;
    return super.delete(
      url,
      data: data,
      queryParameters: queryParameters,
      decoder: decoder,
      options: (options ?? Options())
          .copyWith(headers: {...?options?.headers, ...?auth}),
      cancelToken: cancelToken,
    );
  }
}
