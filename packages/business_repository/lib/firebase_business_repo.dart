import 'dart:developer';

import 'package:business_repository/src/models/models.dart';
import 'package:business_repository/business_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'src/entities/entities.dart';

class FirebaseBusinessRepo implements BusinessRepository{
  final businessRepository = FirebaseFirestore.instance.collection('businesses');
  @override
  Future<void> createBusiness(Business business) async{
    try {
      await businessRepository
      .doc(business.businessID)
      .set(business.toEntity().toDocument());
    } catch (e) {
      rethrow;
    }
  }
  @override
  Future<List<Business>> getBusiness() async{
    try {
      return await businessRepository.get()
      .then((value) => value.docs.map((e) =>
      Business.fromEntity(BusinessEntity.fromDocument(e.data()))
      ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}