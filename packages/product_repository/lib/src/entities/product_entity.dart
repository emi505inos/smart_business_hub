class ProductEntity {
  String productId;
  String name;
  String description;
  int price;
  int quantity;
  int cost;
  String category;
  String imageUrl;

  ProductEntity({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.cost,
    required this.category,
    required this.imageUrl,
  });
  Map<String, Object?> toDocument() {
    return {
      'productId': productId,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'cost': cost,
      'category': category,
      'imageUrl': imageUrl,
    };
  }

  static ProductEntity fromDocument(Map<String, dynamic> doc) {
    return ProductEntity(
      productId: doc['productId'],
      name: doc['name'],
      description: doc['description'],
      price: doc['price'],
      quantity: doc['quantity'],
      cost: doc['cost'],
      category: doc['category'],
      imageUrl: doc['imageUrl'],
    );
  }

}