import 'dart:developer';

import 'package:business_repository/repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDebtRepo implements DebtsRepository{
  final debtsRepository = FirebaseFirestore.instance.collection('debts');
  
  @override
  Future<void> createDebts(Debts debts) async{
    try {
      await debtsRepository
      .doc(debts.debtId)
      .set(debts.toEntity()
      .toDocument());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Debts>> getDebts() async{
   try {
     return await debtsRepository.get()
     .then((value)=> value.docs.map((e)=>
     Debts.fromEntity(DebtEntity.fromDocument(e.data()))
     ).toList());
   } catch (e) {
    log(e.toString());
     rethrow;
   }
  }
  
}