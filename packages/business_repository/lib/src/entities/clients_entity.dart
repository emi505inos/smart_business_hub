class ClientsEntity {
  String clientId;
  String name;
  String phone;

  ClientsEntity({
    required this.clientId,
    required this.name,
    required this.phone,
  });
  
  Map<String, Object?> toDocument() {
    return {
      'clientId': clientId,
      'name': name,
      'phone': phone,
    };
  }
  static ClientsEntity fromDocument(Map<String, dynamic> doc) {
    return ClientsEntity(
      clientId: doc['clientId'],
      name: doc['name'],
      phone: doc['phone'],
    );
  }
}