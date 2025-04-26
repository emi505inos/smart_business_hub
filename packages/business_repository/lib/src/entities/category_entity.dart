class CategoryEntity {
  final String categoryId;
  final String name;

  CategoryEntity({
    required this.categoryId, 
    required this.name
  });

  Map<String, Object?> toDocument() {
    return {
      'categoryId': categoryId,
      'name': name,
    };
  } 
  static CategoryEntity fromDocument(Map<String, dynamic> doc) {
    return CategoryEntity(
      categoryId: doc['categoryId'],
      name: doc['name'],
    );
    }
  }