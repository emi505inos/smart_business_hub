import 'package:business_repository/src/models/models.dart';

class ExpenseEntity {
  String expenseId;
  DateTime dateTime;
  int totalExpense;
  String category;
  String description;
  int payMethod;
  Suplier supplier;

  ExpenseEntity({
    required this.expenseId,
    required this.dateTime,
    required this.totalExpense,
    required this.category,
    required this.description,
    required this.payMethod,
    required this.supplier,
  });
  Map<String, Object?> toDocument() {
    return {
      'expenceId': expenseId,
      'dateTime': dateTime,
      'expence': totalExpense,
      'category': category,
      'description': description,
      'payMethod': payMethod,
      'supplier': supplier,
    };
  }
  static ExpenseEntity fromDocument(Map<String, dynamic> doc) {
    return ExpenseEntity(
      expenseId: doc['expenceId'],
      dateTime: (doc['dateTime']).toDate(),
      totalExpense: doc['totalExpence'],
      category: doc['category'],
      description: doc['description'],
      payMethod: doc['payMethod'], 
      supplier: doc['supplier'],
    );
  }
}