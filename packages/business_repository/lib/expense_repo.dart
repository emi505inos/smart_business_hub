import 'src/models/models.dart';

abstract class ExpenseRepository {
  Future<void> createExpense(Expense expense);

  Future<List<Expense>> getExpenses();
}