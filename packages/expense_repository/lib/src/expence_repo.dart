import 'models/models.dart';

abstract class ExpenseRepository {
  Future<void> createExpence(Expense expence);

  Future<List<Expense>> getExpences();
}