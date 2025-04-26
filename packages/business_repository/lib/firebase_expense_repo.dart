import 'dart:developer';

import 'package:business_repository/expense_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'src/entities/expense_entity.dart';
import 'src/models/models.dart';


class FirebaseExpenseRepo implements ExpenseRepository{
  final expenceCollection = FirebaseFirestore.instance.collection('expence');
  
  @override
  Future<void> createExpense(Expense expence) async{
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
  Future<List<Expense>> getExpenses() async{
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