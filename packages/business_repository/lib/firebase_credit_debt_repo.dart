import 'package:business_repository/src/models/models.dart';

abstract class CreditDebtRepository {
  Future<void> createCreditDebt(CreditDebt creditDebt);
}