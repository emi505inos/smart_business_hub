import 'package:business_repository/src/entities/business_entity.dart';
import 'package:business_repository/src/models/models.dart';

class Business {
  String businessID;
  String picture;
  String  typeOf;
  String name;
  String address;
  String city;
  String state;
  String email;
  String phoneNumber;
  List<Income> income;
  List<Expense> expense;

  Business({
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
  static final empty = Business(
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
  BusinessEntity toEntity() {
    return BusinessEntity(
      businessID: businessID,
      picture: picture,
      typeOf: typeOf,
      name: name,
      address: address,
      city: city,
      state: state,
      email: email,
      phoneNumber: phoneNumber,
      income: income.map((e) => e.toEntity()).toList(),
      expense: expense.map((e) => e.toEntity()).toList(),
    );
  }
  static Business fromEntity(BusinessEntity entity) {
    return Business(
      businessID: entity.businessID,
      picture: entity.picture,
      typeOf: entity.typeOf,
      name: entity.name,
      address: entity.address,
      city: entity.city,
      state: entity.state,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      income: entity.income.map((e) => Income.fromEntity(e)).toList(),
      expense: entity.expense.map((e) => Expense.fromEntity(e)).toList(),
    );
  }
}