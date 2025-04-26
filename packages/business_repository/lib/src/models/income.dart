import 'package:business_repository/src/entities/entities.dart';
import 'package:business_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

class Income {
  String saleId;
  int quantity;
  DateTime dateTime;
  int income;
  String description;
  Clients clients;
  int payMethod;

Income({
  required this.quantity,
  required this.saleId,
  required this.dateTime,
  required this.income,
  required this.description,
  required this.clients,
  required this.payMethod
});

static final empty = Income(
  saleId: Uuid().v1(), 
  dateTime: DateTime.now(), 
  income: 0, 
  description: '', 
  clients: Clients.empty, 
  payMethod: 0, 
  quantity: 1
);

IncomeEntity toEntity() {
  return IncomeEntity(
    saleId: saleId, 
    dateTime: dateTime, 
    income: income, 
    description: description, 
    clients: clients, 
    payMethod: payMethod,
    quantity: quantity
  );
}

static Income fromEntity(IncomeEntity entity) {
  return Income(
    saleId: entity.saleId, 
    dateTime: entity.dateTime, 
    income: entity.income, 
    description: entity.description, 
    clients: entity.clients, 
    payMethod: entity.payMethod,
    quantity: entity.quantity
  );
}
}

