import 'package:income_repository/income_repository.dart';

abstract class IncomeRepository{

  Future<void> createIncome(Income income);
  
  Future<List<Income>> getIncome();
}