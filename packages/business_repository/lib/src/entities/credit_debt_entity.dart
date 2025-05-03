import 'package:cloud_firestore/cloud_firestore.dart';

class CreditDebtEntity {
  final String client;
  final List<Map<String, dynamic>> debts;

  CreditDebtEntity({
    required this.client,
    required this.debts,
  });

  Map<String, Object?> toDocument() {
    return {
      'client': client,
      'debts': debts.map((debt) => {
        'creditDebtId': debt['creditDebtId'],
        'amount': debt['amount'],
        'description': debt['description'],
        'dateTime': Timestamp.fromDate(debt['dateTime']),
      }).toList(),
    };
  }

  static CreditDebtEntity fromDocument(Map<String, dynamic> doc) {
    return CreditDebtEntity(
      client: doc['client'],
      debts: (doc['debts'] as List<dynamic>).map((debt) => {
        'creditDebtId': debt['creditDebtId'],
        'amount': debt['amount'],
        'description': debt['description'],
        'dateTime': (debt['dateTime'] as Timestamp).toDate(),
      }).toList(),
    );
  }
}