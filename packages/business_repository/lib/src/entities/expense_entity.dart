
class ExpenseEntity {
  String expenseId;
  DateTime dateTime;
  int totalExpense;
  String category;
  String description;
  int payMethod;
  String supplier;

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
      'expenseId': expenseId,
      'dateTime': dateTime,
      'totalExpense': totalExpense,
      'category': category,
      'description': description,
      'payMethod': payMethod,
      'supplier': supplier,
    };
  }
  static ExpenseEntity fromDocument(Map<String, dynamic> doc) {
    return ExpenseEntity(
      expenseId: doc['expenseId'],
      dateTime: (doc['dateTime']).toDate(),
      totalExpense: doc['totalExpense'],
      category: doc['category'],
      description: doc['description'],
      payMethod: doc['payMethod'], 
      supplier: doc['supplier'],
    );
  }
}