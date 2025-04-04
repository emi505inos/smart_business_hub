import 'package:income_repository/src/entities/income_entity.dart';
import 'package:uuid/uuid.dart';

class Income {
  String saleId;
  DateTime dateTime;
  int income;
  String description;
  String clients;
  int payMethod;

Income({
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
  clients: '', 
  payMethod: 0
);

IncomeEntity toEntity() {
  return IncomeEntity(
    saleId: saleId, 
    dateTime: dateTime, 
    income: income, 
    description: description, 
    clients: clients, 
    payMethod: payMethod
  );
}

static Income fromEntity(IncomeEntity entity) {
  return Income(
    saleId: entity.saleId, 
    dateTime: entity.dateTime, 
    income: entity.income, 
    description: entity.description, 
    clients: entity.clients, 
    payMethod: entity.payMethod
  );
}

}

