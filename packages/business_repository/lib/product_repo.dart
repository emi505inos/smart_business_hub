import 'package:business_repository/src/models/product.dart';

abstract class ProductRepository {
  Future<void> createProduct(Product product);
  
  Future<List<Product>> getProduct();
}