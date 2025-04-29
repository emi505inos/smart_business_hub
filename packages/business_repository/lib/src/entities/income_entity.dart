
class IncomeEntity {
  String saleId;
  DateTime dateTime;
  int quantity;
  int income;
  String description;
  String clients;
  int payMethod;

  IncomeEntity({
  required this.saleId,
  required this.dateTime,
  required this.income,
  required this.description,
  required this.clients,
  required this.payMethod, 
  required this.quantity
});
Map<String, Object?> toDocument() {
  return {
    'saleId': saleId,
    'dateTime': dateTime,
    'income': income,
    'description': description,
    'clients': clients,
    'payMethod': payMethod,
    'quantity': quantity
  };
}
static IncomeEntity fromDocument(Map<String, dynamic> doc) {
  return IncomeEntity(
    saleId: doc['saleId'], 
    dateTime: (doc['dateTime']).toDate(), 
    income: doc['income'], 
    description: doc['description'], 
    clients: doc['clients'], 
    payMethod: doc['payMethod'],
    quantity: doc['quantity']
  );
}
}