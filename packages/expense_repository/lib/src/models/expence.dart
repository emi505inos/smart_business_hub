import 'package:expense_repository/src/entities/expense_entity.dart';
import 'package:uuid/uuid.dart';

class Expense {
  String expenseId;
  DateTime dateTime;
  int totalExpence;
  String category;
  String description;
  String supplier;
  int payMethod;

  Expense({
    required this.expenseId,
    required this.dateTime,
    required this.totalExpence,
    required this.category,
    required this.supplier,
    required this.description,
    required this.payMethod,
  });

  static final empty = Expense(
    expenseId: Uuid().v1(),
    dateTime: DateTime.now(),
    totalExpence: 0,
    category: '',
    description: '',
    payMethod: 0, 
    supplier: '',
  );
  
  ExpenseEntity toEntity() {
    return ExpenseEntity(
      expenseId: expenseId,
      dateTime: dateTime,
      totalExpense: totalExpence,
      category: category,
      description: description,
      payMethod: payMethod,
      supplier: supplier,
    );
  }

  static Expense fromEntity(ExpenseEntity entity) {
    return Expense(
      expenseId: entity.expenseId,
      dateTime: entity.dateTime,
      totalExpence: entity.totalExpense,
      category: entity.category,
      description: entity.description,
      payMethod: entity.payMethod,
      supplier: entity.supplier,
    );
  }
}