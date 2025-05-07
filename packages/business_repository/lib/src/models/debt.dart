import 'package:business_repository/src/entities/debt_entity.dart';
import 'package:uuid/uuid.dart';

class Debts {
  String debtId;
  int debtAmount;
  DateTime dateTime;
  int payMethod;
  String clients;
  String description;
  String suplier;

  Debts ({
    required this.debtId,
    required this.debtAmount,
    required this.dateTime,
    required this.payMethod,
    required this.clients,
    required this.description,
    required this.suplier
  });

  static final empty = Debts (
    debtId: Uuid().v1(),
    debtAmount: 0,
    description: '',
    clients: '',
    dateTime: DateTime.now(),
    suplier: '',
    payMethod: 0
  );

  DebtEntity toEntity() {
    return DebtEntity(
      suplier: suplier,
      debts: [{
      debtId: debtId, 
      'debtAmount': debtAmount, 
      'dateTime': dateTime, 
      'payMethod': payMethod, 
      'clients': clients, 
      'description': description,
      }]
    );
  }

  static Debts fromEntity(Map<String, dynamic>  debtData) {
    return Debts(
      suplier: debtData['suplier'],
      debtId: debtData['debtId'],
      debtAmount: debtData['debtAmount'], 
      dateTime: (debtData['amount']).toDate(), 
      payMethod: debtData['payMethod'], 
      clients: debtData['clients'], 
      description: debtData['description'], 
      
    );
  }
}