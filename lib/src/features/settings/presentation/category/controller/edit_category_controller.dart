// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../data/category_repository.dart';
import '../../../domain/category/category_model.dart';

// 📦 Package imports:

// 🌎 Project imports:

class CategoryControllerNotifier
    extends StateNotifier<AsyncValue<List<Category>?>> {
  CategoryControllerNotifier(this.categoryRepository)
      : super(const AsyncData(null));

  final CategoryRepository categoryRepository;

  Future<void> loadCategories() async {
    if (state.asData?.value == null) state = const AsyncLoading();
    state = await AsyncValue.guard(() => categoryRepository.getCategoryList());
  }

  Future<void> deleteCategory(Category category) async {
    state = await AsyncValue.guard(() async {
      await categoryRepository.deleteCategory(category: category);
      return categoryRepository.getCategoryList();
    });
  }

  Future<void> editCategory(Category category) async {
    state = await AsyncValue.guard(() async {
      if (category.id == null) {
        await categoryRepository.createCategory(category: category);
      } else {
        await categoryRepository.editCategory(category: category);
      }
      return categoryRepository.getCategoryList();
    });
  }

  Future<void> reorderCategory(int from, int to) async {
    final categoryList = List<Category>.from(state.asData?.value ?? []);
    categoryList.insert(to, categoryList.removeAt(from));
    state = AsyncData(categoryList);
    state = await AsyncValue.guard(() async {
      await categoryRepository.reorderCategory(from: from, to: to);
      return categoryRepository.getCategoryList();
    });
  }
}

final categoryControllerProvider = StateNotifierProvider<
    CategoryControllerNotifier, AsyncValue<List<Category>?>>(
  (ref) => CategoryControllerNotifier(ref.watch(categoryRepositoryProvider)),
);
