import 'package:business_repository/src/entities/entities.dart';
import 'package:uuid/uuid.dart';

class Income {
  String saleId;
  int quantity;
  DateTime dateTime;
  int income;
  String description;
  String clients;
  int payMethod;
  String category;

Income({
  required this.quantity,
  required this.saleId,
  required this.dateTime,
  required this.income,
  required this.description,
  required this.clients,
  required this.payMethod,
  required this.category,
});

static final empty = Income(
  saleId: Uuid().v1(), 
  dateTime: DateTime.now(), 
  income: 0, 
  description: '', 
  clients: '', 
  payMethod: 0, 
  quantity: 1,
  category: ''
);

IncomeEntity toEntity() {
  return IncomeEntity(
    saleId: saleId, 
    dateTime: dateTime, 
    income: income, 
    description: description, 
    clients: clients, 
    payMethod: payMethod,
    quantity: quantity,
    category: category,
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
    quantity: entity.quantity,
    category: entity.category,
  );
}
}

