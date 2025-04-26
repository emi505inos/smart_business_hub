import 'dart:developer';

import 'package:business_repository/src/entities/entities.dart';
import 'package:business_repository/src/models/suplier.dart';
import 'package:business_repository/supliers_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseSupliersRepo implements SupliersRepository{
  final suplierRepository = FirebaseFirestore.instance.collection('supliers');

  @override
  Future<void> createSuplier(Suplier suplier) async{
    try {
      await suplierRepository
      .doc(suplier.suplierId)
      .set(suplier.toEntity().toDocument());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Suplier>> getSuplier() async{
    try {
      return await suplierRepository.get()
      .then((value) => value.docs.map((e) =>
      Suplier.fromEntity(SuplierEntity.fromDocument(e.data()))
      ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}