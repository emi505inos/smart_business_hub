import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/business_repo.dart';
import 'package:user_repository/src/models/models.dart';



class FirebaseBusinessRepo1 implements BusinessRepository1{  
  @override
  Future<void> setBusiness(String userId, Business1 business) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null || user.uid != userId) {
    throw Exception('Usuario no autenticado o ID de usuario no coincide.');
  }
  if (business.owner != userId) {
    throw Exception('El usuario no es el dueño del negocio.');
  }
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('business')
        .doc(business.businessID)
        .set(business.toEntity().toDocument());
  } catch (e) {
    log('Error al agregar negocio: $e');
    rethrow;
  }
}
  // @override
  // Future<void> createBusiness(Business1 business) async{
  //   try {
  //     await businessRepository
  //     .doc(business.businessID)
  //     .set(business.toEntity().toDocument());
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  // @override
  // Future<List<Business1>> getBusiness() async{
  //   try {
  //     return await businessRepository.get()
  //     .then((value) => value.docs.map((e) =>
  //     Business1.fromEntity(Business1Entity.fromDocument(e.data()))
  //     ).toList());
  //   } catch (e) {
  //     log(e.toString());
  //     rethrow;
  //   }
  // }
}