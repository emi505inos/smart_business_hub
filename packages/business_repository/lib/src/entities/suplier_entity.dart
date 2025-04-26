class SuplierEntity {
  String suplierId;
  String name;
  int phoneNumber;

  SuplierEntity({
    required this.suplierId,
    required this.name,
    required this.phoneNumber,
  });
  Map<String, Object?> toDocument() {
    return {
      'suplierId': suplierId,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
  static SuplierEntity fromDocument(Map<String, dynamic> doc) {
    return SuplierEntity(
      suplierId: doc['suplierId'],
      name: doc['name'],
      phoneNumber: doc['phoneNumber'],
    );
  }
}