// Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import '../../../data/about_repository.dart';
import '../../../domain/about/about_model.dart';

part 'about_controller.g.dart';

@riverpod
Future<About?> aboutController(AboutControllerRef ref) async {
  final token = CancelToken();
  final result = await ref
      .watch(aboutRepositoryProvider)
      .getAbout(cancelToken: CancelToken());
  ref.keepAlive();
  ref.onDispose(token.cancel);
  return result;
}
