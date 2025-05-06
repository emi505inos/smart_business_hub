class DebtEntity {
  String debtId;
  int debtAmount;
  DateTime dateTime;
  int payMethod;
  String clients;
  String description;
  String suplier;

  DebtEntity({
    required this.debtId,
    required this.debtAmount,
    required this.dateTime,
    required this.payMethod,
    required this.clients,
    required this.description,
    required this.suplier
  });

  Map<String, Object?> toDocument() {
    return {
      'debtId': debtId,
      'debtAmount': debtAmount,
      'dateTime': dateTime,
      'payMethod': payMethod,
      'clients': clients,
      'description': description,
      'suplier': suplier
    };
  }
  static DebtEntity fromDocument(Map<String, dynamic> doc) {
    return DebtEntity(
      debtId: doc['debtId'], 
      debtAmount: doc['debtAmount'], 
      dateTime: (doc['dateTime']).toDate(), 
      payMethod: doc['payMethod'], 
      clients: doc['clients'], 
      description: doc['description'], 
      suplier: doc['suplier']
    );
  }
}