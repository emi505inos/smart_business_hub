import 'package:business_repository/src/entities/business_entity.dart';

class Business {
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

  Business({
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
  static final empty = Business(
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
  BusinessEntity toEntity() {
    return BusinessEntity(
      businessID: businessID,
      owner: owner,
      picture: picture,
      typeOf: typeOf,
      name: name,
      address: address,
      city: city,
      state: state,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
  static Business fromEntity(BusinessEntity entity) {
    return Business(
      businessID: entity.businessID,
      owner: empty.owner,
      picture: entity.picture,
      typeOf: entity.typeOf,
      name: entity.name,
      address: entity.address,
      city: entity.city,
      state: entity.state,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
    );
  }
}