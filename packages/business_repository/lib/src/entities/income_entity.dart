
class IncomeEntity {
  String saleId;
  DateTime dateTime;
  int quantity;
  int income;
  String description;
  String clients;
  int payMethod;
  String category;

  IncomeEntity({
  required this.saleId,
  required this.dateTime,
  required this.income,
  required this.description,
  required this.clients,
  required this.payMethod, 
  required this.quantity,
  required this.category,
});
Map<String, Object?> toDocument() {
  return {
    'saleId': saleId,
    'dateTime': dateTime,
    'income': income,
    'description': description,
    'clients': clients,
    'payMethod': payMethod,
    'quantity': quantity,
    'category': category,
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
    quantity: doc['quantity'],
    category: doc['category'],
  );
}
}