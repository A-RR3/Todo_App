import 'package:training_task1/domain/entities/categories.dart';

abstract class CategoriesInteractor {
  Future<List<Category>> getCategories();
  Future<Category> findCategory(int categoryId);
  Future<int> createCategory(Category category);
  Future<int> deleteCategory(Category category);
}
