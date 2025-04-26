import 'dart:developer';

import 'package:business_repository/src/entities/category_entity.dart';
import 'package:business_repository/src/models/category.dart';
import 'package:business_repository/category_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCategoryRepo implements CategoryRepository{
  final categoryRepository = FirebaseFirestore.instance.collection('categories');

  @override
  Future<void> createCategory(Category category) async{
    try {
      await categoryRepository
      .doc(category.categoryId)
      .set(category.toEntity().toDocument());
    } catch (e) {
      rethrow;
    }
  }
  @override
  Future<List<Category>> getCategory() async{
    try {
      return await categoryRepository.get()
      .then((value) => value.docs.map((e) =>
      Category.fromEntity(CategoryEntity.fromDocument(e.data()))
      ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}