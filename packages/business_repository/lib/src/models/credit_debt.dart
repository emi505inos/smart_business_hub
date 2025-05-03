import 'package:business_repository/src/entities/entities.dart';
import 'package:uuid/uuid.dart';

class CreditDebt {
  String creditDebtId;
  int amount;
  String description;
  String client;
  DateTime dateTime;

  CreditDebt({
    required this.creditDebtId,
    required this.amount,
    required this.description,
    required this.client,
    required this.dateTime
  });

  static final empty = CreditDebt(
    creditDebtId: Uuid().v1(), 
    amount: 0, 
    description: '', 
    client: '',
    dateTime: DateTime.now()
  );

  CreditDebtEntity toEntity() {
    return CreditDebtEntity(
      client: client, 
      debts: [{
        'creditDebtId': creditDebtId,
          'amount': amount,
          'description': description,
          'dateTime': dateTime
      }],
    );
  }

  static CreditDebt fromEntity(Map<String, dynamic> debtData) {
    return CreditDebt (
      client: debtData['client'],
      amount: debtData['amount'],
      creditDebtId: debtData['creditDebtId'],
      dateTime: (debtData['amount']).toDate(),
      description: debtData['description'],

    );
  }
}