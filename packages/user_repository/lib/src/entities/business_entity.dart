class Business1Entity {
  String businessID;
  String owner;
  String picture;
  String?  typeOf;
  String name;
  String address;
  String city;
  String state;
  String email;
  String phoneNumber;

  Business1Entity({
    required this.businessID,
    required this.owner,
    required this.picture,
    required this.typeOf,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.email,
    required this.phoneNumber,
  });
  static final empty = Business1Entity(
    businessID: '',
    owner: '',
    picture: '',
    typeOf: '',
    name: '',
    address: '',
    city: '',
    state: '',
    email: '',
    phoneNumber: '',
  );
  Map<String, Object?> toDocument() {
    return {
      'businessID': businessID,
      'owner': owner,
      'picture': picture,
      'typeOf': typeOf,
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
  static Business1Entity fromDocument(Map<String, dynamic> doc) {
    return Business1Entity(
      businessID: doc['businessID'],
      owner: doc['owner'],
      picture: doc['picture'],
      typeOf: doc['typeOf'],
      name: doc['name'],
      address: doc['address'],
      city: doc['city'],
      state: doc['state'],
      email: doc['email'],
      phoneNumber: doc['phoneNumber'],
    );
  }
}