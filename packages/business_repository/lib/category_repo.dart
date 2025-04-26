import 'package:business_repository/src/models/category.dart';

abstract class CategoryRepository {
  Future<void> createCategory(Category category);

  Future<List<Category>> getCategory();
}