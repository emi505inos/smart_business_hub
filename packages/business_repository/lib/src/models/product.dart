
import 'package:business_repository/src/entities/entities.dart';
import 'package:business_repository/src/models/category.dart';
import 'package:uuid/uuid.dart';


class Product {
  String productId;
  String name;
  String description;
  int price;
  int quantity;
  int cost;
  Category category;
  String imageUrl;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.cost,
    required this.category,
    required this.imageUrl,
  });

  static final empty = Product(
    productId: Uuid().v1(),
    name: '',
    description: '',
    price: 0,
    quantity: 1,
    cost: 0,
    category: Category.empty,
    imageUrl: '',
  ); 

  ProductEntity toEntity() {
    return ProductEntity(
      productId: productId,
      name: name,
      description: description,
      price: price,
      quantity: quantity,
      cost: cost,
      category: category,
      imageUrl: imageUrl,
    );
  }
  static Product fromEntity(ProductEntity entity) {
      return Product(
        productId: entity.productId,
        name: entity.name,
        description: entity.description,
        price: entity.price,
        quantity: entity.quantity,
        cost: entity.cost,
        category: entity.category,
        imageUrl: entity.imageUrl,
      );
    }
}