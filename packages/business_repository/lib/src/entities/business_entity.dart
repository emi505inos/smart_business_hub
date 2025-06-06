class BusinessEntity {
  String businessID;
  String ownerId;
  String owner;
  String picture;
  String?  typeOf;
  String name;
  String address;
  String city;
  String email;
  String phoneNumber;

  BusinessEntity({
    required this.businessID,
    required this.ownerId,
    required this.owner,
    required this.picture,
    required this.typeOf,
    required this.name,
    required this.address,
    required this.city,
    required this.email,
    required this.phoneNumber,
  });
  static final empty = BusinessEntity(
    businessID: '',
    ownerId: '',
    owner: '',
    picture: '',
    typeOf: '',
    name: '',
    address: '',
    city: '',
    email: '',
    phoneNumber: '',
  );
  Map<String, Object?> toDocument() {
    return {
      'businessID': businessID,
      'ownerId': ownerId,
      'owner': owner,
      'picture': picture,
      'typeOf': typeOf,
      'name': name,
      'address': address,
      'city': city,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
  static BusinessEntity fromDocument(Map<String, dynamic> doc) {
    return BusinessEntity(
      businessID: doc['businessID'],
      ownerId: doc['ownerId'],
      owner: doc['owner'],
      picture: doc['picture'],
      typeOf: doc['typeOf'],
      name: doc['name'],
      address: doc['address'],
      city: doc['city'],
      email: doc['email'],
      phoneNumber: doc['phoneNumber'],
    );
  }
}