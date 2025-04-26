import 'dart:developer';

import 'package:business_repository/src/entities/entities.dart';
import 'package:business_repository/src/models/models.dart';
import 'package:business_repository/income_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseIncomeRepo implements IncomeRepository{
  final incomeCollection = FirebaseFirestore.instance.collection('income');


  @override
  Future<void> createIncome(Income income) async{
    try {
      await incomeCollection
      .doc(income.saleId)
      .set(income.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Income>> getIncome() async{
    try {
      return await incomeCollection
      .get()
      .then((value) => value.docs.map((e) => 
      Income.fromEntity(IncomeEntity.fromDocument(e.data()))
      ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}