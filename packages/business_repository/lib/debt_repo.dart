import 'package:business_repository/src/models/models.dart';

abstract class DebtsRepository {

  Future<void> createDebts(Debts debts);

  // Future<List<Debts>> getDebts();
}