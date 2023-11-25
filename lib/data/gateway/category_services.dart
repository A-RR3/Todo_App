import 'package:training_task1/data/datasource/database_services.dart';
import 'package:training_task1/domain/entities/categories.dart';
import 'package:training_task1/domain/interfaces/category_interactor.dart';
import 'package:training_task1/utils/utils.dart';

class CategoriesServices extends DataBaseServices<Category>
    implements CategoriesInterface {
  String get table => AppKeys.categoryTable;

  @override
  Future<int> createCategory(Category model) async {
    return await create(model);
  }

  @override
  Future<Category> findCategory(int categoryId) async {
    return retrieveOne(table, Category.fromMap, categoryId);
  }

  @override
  Future<List<Category>> getCategories() async {
    return retrieveAll(table, Category.fromMap);
  }

  @override
  Future<int> deleteCategory(Category model) async {
    return await delete(model);
  }
}
