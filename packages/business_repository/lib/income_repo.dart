import 'package:business_repository/src/models/models.dart';

abstract class IncomeRepository{

  Future<void> createIncome(Income income);
  
  Future<List<Income>> getIncome();
}