import 'package:uuid/uuid.dart';

class NewSale {
  String saleId;
  DateTime dateTime;
  int income;
  String description;
  String clients;
  int payMethod;

NewSale({
  required this.saleId,
  required this.dateTime,
  required this.income,
  required this.description,
  required this.clients,
  required this.payMethod
});

static final empty = NewSale(
  saleId: Uuid().v1(), 
  dateTime: DateTime.now(), 
  income: 0, 
  description: '', 
  clients: '', 
  payMethod: -1
);

}

