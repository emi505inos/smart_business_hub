
import 'package:business_repository/src/entities/category_entity.dart';
import 'package:uuid/uuid.dart';

class Category {
  String categoryId;
  String name;

  Category({
    required this.categoryId, 
    required this.name
  });

  static final empty = Category(
    categoryId: Uuid().v1(),
    name: ''
  );
  
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
    );
  }
  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
    );
  }
}