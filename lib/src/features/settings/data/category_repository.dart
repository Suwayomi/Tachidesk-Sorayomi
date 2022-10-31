// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../constants/endpoints.dart';
import '../../../global_providers/global_providers.dart';
import '../../../utils/extensions/custom_extensions/map_extensions.dart';
import '../../../utils/storage/dio/dio_client.dart';
import '../domain/category/category_model.dart';

part 'category_repository.g.dart';

class CategoryRepository {
  final DioClient dioClient;

  CategoryRepository(this.dioClient);

  Future<List<Category>?> getCategoryList({CancelToken? cancelToken}) async =>
      (await dioClient.get<List<Category>, Category>(
        CategoryUrl.category,
        decoder: (e) =>
            e is Map<String, dynamic> ? Category.fromJson(e) : Category(),
        cancelToken: cancelToken,
      ))
          .data;

  Future<void> createCategory({
    required Category category,
    CancelToken? cancelToken,
  }) =>
      dioClient.post(
        CategoryUrl.category,
        data: FormData.fromMap(category.toJson().filterOutNulls),
        cancelToken: cancelToken,
      );

  Future<void> editCategory({
    required Category category,
    CancelToken? cancelToken,
  }) async =>
      category.id != null
          ? await dioClient.patch(
              CategoryUrl.withId(category.id!),
              data: FormData.fromMap(category.toJson().filterOutNulls),
              cancelToken: cancelToken,
            )
          : null;

  Future<void> deleteCategory({
    required Category category,
    CancelToken? cancelToken,
  }) async =>
      (category.id != null)
          ? dioClient.delete(
              CategoryUrl.withId(category.id!),
              cancelToken: cancelToken,
            )
          : null;

  Future<void> reorderCategory({
    required int from,
    required int to,
  }) =>
      dioClient.patch(
        CategoryUrl.reorder,
        data: FormData.fromMap({"from": from, "to": to}),
      );
}

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) =>
    CategoryRepository(ref.watch(dioClientKeyProvider));
