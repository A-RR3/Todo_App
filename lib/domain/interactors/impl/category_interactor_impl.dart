import 'package:training_task1/domain/entities/categories.dart';
import 'package:training_task1/domain/interactors/interface/category_interactor.dart';
import 'package:training_task1/domain/gateway/category_services.dart';

class CategoriesInteractorImpl implements CategoriesInteractor {
  // final _gateway = CategoryProvider();
  final CategoriesServices _gateway;

  CategoriesInteractorImpl() : _gateway = CategoriesServices();

  @override
  Future<List<Category>> getCategories() async {
    return await _gateway.getCategories();
  }

  @override
  Future<Category> findCategory(int categoryId) async {
    return await _gateway.findCategory(categoryId);
  }

  @override
  Future<int> createCategory(Category category) async {
    return await _gateway.createCategory(category);
  }

   @override
  Future<int> deleteCategory(Category category) async {
    return await _gateway.createCategory(category);
  }
}
