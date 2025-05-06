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
      debtId: debtId, 
      debtAmount: debtAmount, 
      dateTime: dateTime, 
      payMethod: payMethod, 
      clients: clients, 
      description: description, 
      suplier: suplier
    );
  }

  static Debts fromEntity(DebtEntity entity) {
    return Debts(
      debtId: empty.debtId,
      debtAmount: empty.debtAmount, 
      dateTime: empty.dateTime, 
      payMethod: empty.payMethod, 
      clients: empty.clients, 
      description: empty.description, 
      suplier: empty.suplier
    );
  }
}