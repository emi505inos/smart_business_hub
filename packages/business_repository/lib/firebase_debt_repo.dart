
import 'package:business_repository/repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDebtRepo implements DebtsRepository{
  final FirebaseFirestore debtsRepository = FirebaseFirestore.instance;
  
  @override
  Future<void> createDebts(Debts debts) async{
    DocumentReference docRef = debtsRepository.collection('debts').doc(debts.suplier);
    DocumentSnapshot docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      List<Map<String, dynamic>> currentDebts = List<Map<String, dynamic>>.from(docSnapshot.get('debts') ?? []);
      currentDebts.add({
      'debtAmount': debts.debtAmount, 
      'dateTime': Timestamp.fromDate(debts.dateTime), 
      'payMethod': debts.payMethod, 
      'clients': debts.clients, 
      'description': debts.description,
      });
      await docRef.update({'debts': currentDebts});
    } else {
      await docRef.set({
        'suplier': debts.suplier,
        'debts': [{
          'debtAmount': debts.debtAmount, 
          'dateTime': Timestamp.fromDate(debts.dateTime), 
          'payMethod': debts.payMethod, 
          'clients': debts.clients, 
          'description': debts.description,
      }]
      });
    }
  }

  // @override
  // Future<List<Debts>> getDebts() async{
  //  try {
  //    return await debtsRepository.get()
  //    .then((value)=> value.docs.map((e)=>
  //    Debts.fromEntity(DebtEntity.fromDocument(e.data()))
  //    ).toList());
  //  } catch (e) {
  //   log(e.toString());
  //    rethrow;
  //  }
  // }
  Stream<List<CreditDebtEntity>> getCreditDebtStream() {
    return debtsRepository.collection('debts').snapshots().map((snapshot){
      return snapshot.docs.map((doc) {
        return CreditDebtEntity.fromDocument(doc.data());
      }).toList();
    });
  }
}