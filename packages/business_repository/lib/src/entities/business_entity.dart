import 'package:business_repository/src/entities/entities.dart';

class BusinessEntity {
  String businessID;
  String picture;
  String  typeOf;
  String name;
  String address;
  String city;
  String state;
  String email;
  String phoneNumber;
  List<IncomeEntity> income;
  List<ExpenseEntity> expense;



  BusinessEntity({
    required this.businessID,
    required this.picture,
    required this.typeOf,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.email,
    required this.phoneNumber,
    required this.income,
    required this.expense,
  });
  static final empty = BusinessEntity(
    businessID: '',
    picture: '',
    typeOf: '',
    name: '',
    address: '',
    city: '',
    state: '',
    email: '',
    phoneNumber: '',
    income: [],
    expense: [],
  );
  Map<String, Object?> toDocument() {
    return {
      'businessID': businessID,
      'picture': picture,
      'typeOf': typeOf,
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'email': email,
      'phoneNumber': phoneNumber,
      'income': income.map((e) => e.toDocument()).toList(),
      'expense': expense.map((e) => e.toDocument()).toList(),
    };
  }
  static BusinessEntity fromDocument(Map<String, dynamic> doc) {
    return BusinessEntity(
      businessID: doc['businessID'],
      picture: doc['picture'],
      typeOf: doc['typeOf'],
      name: doc['name'],
      address: doc['address'],
      city: doc['city'],
      state: doc['state'],
      email: doc['email'],
      phoneNumber: doc['phoneNumber'],
      income: (doc['income'] as List).map((e) => IncomeEntity.fromDocument(e)).toList(),
      expense: (doc['expense'] as List).map((e) => ExpenseEntity.fromDocument(e)).toList(),
    );
  }
}