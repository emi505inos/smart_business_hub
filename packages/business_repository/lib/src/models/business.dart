import 'package:business_repository/src/entities/business_entity.dart';

class Business {
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

  Business({
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
  static final empty = Business(
    ownerId: '',
    businessID: '',
    owner: '',
    picture: '',
    typeOf: '',
    name: '',
    address: '',
    city: '',
    email: '',
    phoneNumber: '',
  );
  BusinessEntity toEntity() {
    return BusinessEntity(
      ownerId: ownerId,
      businessID: businessID,
      owner: owner,
      picture: picture,
      typeOf: typeOf,
      name: name,
      address: address,
      city: city,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
  static Business fromEntity(BusinessEntity entity) {
    return Business(
      businessID: entity.businessID,
      ownerId: empty.ownerId,
      owner: empty.owner,
      picture: entity.picture,
      typeOf: entity.typeOf,
      name: entity.name,
      address: entity.address,
      city: entity.city,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
    );
  }
}