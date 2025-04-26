import 'dart:developer';

import 'package:business_repository/src/entities/entities.dart';
import 'package:business_repository/src/models/models.dart';
import 'package:business_repository/product_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FirebaseProductRepo implements ProductRepository{
  final productRepository = FirebaseFirestore.instance.collection('products');
  
  @override
  Future<void> createProduct(Product product) async{
    try {
      await productRepository
      .doc(product.productId)
      .set(product.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  @override
  Future<List<Product>> getProduct() async{
    try {
      return await productRepository.get()
      .then((value) => value.docs.map((e) =>
      Product.fromEntity(ProductEntity.fromDocument(e.data()))
      ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}