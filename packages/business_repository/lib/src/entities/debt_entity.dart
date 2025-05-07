import 'package:cloud_firestore/cloud_firestore.dart';

class DebtEntity {
  String suplier;
  List<Map<String, dynamic>> debts;

  DebtEntity({
    required this.debts,
    required this.suplier
  });

  Map<String, Object?> toDocument() {
    return {
      'suplier': suplier,
      'debts': debts.map((debt) => {
        'debtId': debt['debtId'],
        'debtAmount': debt['debtAmount'],
        'dateTime': Timestamp.fromDate(debt['dateTime']),
        'payMethod': debt['payMethod'],
        'clients': debt['clients'],
        'description': debt['description'],
      }).toList()
    };
  }
  static DebtEntity fromDocument(Map<String, dynamic> doc) {
    return DebtEntity(
 
      suplier: doc['suplier'],
      debts: (doc['debts'] as List<dynamic>).map((debt) => {
        'debtId': debt['debtId'],
        'debtAmount': debt['debtAmount'],
        'dateTime': (debt['dateTime'] as Timestamp).toDate(),
        'payMethod': debt['payMethod'],
        'clients': debt['clients'],
        'description': debt['description'],
        }).toList(),
    );
  }
}