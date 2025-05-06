import 'package:business_repository/repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCreditDebt implements CreditDebtRepository{
  final FirebaseFirestore crediDebtCollection = FirebaseFirestore.instance;
  
  @override
  Future<void> createCreditDebt(CreditDebt creditDebt) async{
    DocumentReference docRef = crediDebtCollection.collection('creditDebt').doc(creditDebt.client);
    DocumentSnapshot docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      List<Map<String, dynamic>> currentDebts = List<Map<String, dynamic>>.from(docSnapshot.get('debts') ?? []);
      currentDebts.add({
        'creditDebtId': creditDebt.creditDebtId,
        'amount': creditDebt.amount,
        'description': creditDebt.description,
        'dateTime': Timestamp.fromDate(creditDebt.dateTime)
      });
      await docRef.update({'debts': currentDebts});
    } else {
      await docRef.set({
        'client': creditDebt.client,
        'debts': [{
          'creditDebtId': creditDebt.creditDebtId,
          'amount': creditDebt.amount,
          'description': creditDebt.description,
          'dateTime': Timestamp.fromDate(creditDebt.dateTime)
        }]
      });
    }
  }
  Stream<List<CreditDebtEntity>> getCreditDebtStream() {
    return crediDebtCollection.collection('creditDebt').snapshots().map((snapshot){
      return snapshot.docs.map((doc) {
        return CreditDebtEntity.fromDocument(doc.data());
      }).toList();
    });
  }
}
  // @override
  // Future<void> createCreditDebt(CreditDebt creditDebt) async{
  //   try {
  //     await crediDebtCollection
  //     .doc(creditDebt.creditDebtId)
  //     .set(creditDebt.toEntity().toDocument());
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
// service cloud.firestore {
//   match /databases/{database}/documents {
//     match /businesses/{businessId}/{document=**} {
//       allow read, write: if request.auth != null && request.auth.uid == resource.data.ownerId;
//     }
//   }
// }
