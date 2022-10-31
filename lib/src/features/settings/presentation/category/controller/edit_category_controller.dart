// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../data/category_repository.dart';
import '../../../domain/category/category_model.dart';

part 'edit_category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  Future<List<Category>?> build() async => loadCategories(ref);

  Future<List<Category>?> loadCategories(
    AutoDisposeAsyncNotifierProviderRef<List<Category>?> ref,
  ) async {
    final token = CancelToken();
    final result = await ref
        .watch(categoryRepositoryProvider)
        .getCategoryList(cancelToken: CancelToken());
    ref.keepAlive();
    ref.onDispose(token.cancel);
    return result;
  }

  Future<void> deleteCategory(Category category) async {
    state = await AsyncValue.guard(() async {
      await ref
          .read(categoryRepositoryProvider)
          .deleteCategory(category: category);
      return loadCategories(ref);
    });
  }

  Future<void> editCategory(Category category) async {
    final categoryRepository = ref.read(categoryRepositoryProvider);
    state = await AsyncValue.guard(() async {
      if (category.id == null) {
        await categoryRepository.createCategory(category: category);
      } else {
        await categoryRepository.editCategory(category: category);
      }
      return loadCategories(ref);
    });
  }

  Future<void> reorderCategory(int from, int to) async {
    final categoryRepository = ref.read(categoryRepositoryProvider);
    final categoryList = List<Category>.from(state.asData?.value ?? []);
    categoryList.insert(to, categoryList.removeAt(from));
    state = AsyncData(categoryList);
    state = await AsyncValue.guard(() async {
      await categoryRepository.reorderCategory(from: from, to: to);
      return loadCategories(ref);
    });
  }
}

@riverpod
List<Category> categoryList(CategoryListRef ref) {
  final categoryList = List<Category>.from(
    ref.watch(categoryControllerProvider).asData?.value ?? [],
  );
  if (categoryList.isNotEmpty) categoryList.removeAt(0);
  return categoryList;
}
