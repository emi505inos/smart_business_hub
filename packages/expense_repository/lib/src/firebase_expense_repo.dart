import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/src/expence_repo.dart';

import 'entities/entities.dart';
import 'models/models.dart';

class FirebaseExpenceRepo implements ExpenseRepository{
  final expenceCollection = FirebaseFirestore.instance.collection('expence');
  
  @override
  Future<void> createExpence(Expense expence) async{
    try {
      await expenceCollection
      .doc(expence.expenseId)
      .set(expence.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<List<Expense>> getExpences() async{
    try {
      return await expenceCollection
      .get()
      .then((value) => value.docs.map((e) => 
      Expense.fromEntity(ExpenseEntity.fromDocument(e.data()))
      ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  
}