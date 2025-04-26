import 'dart:developer';

import 'package:business_repository/src/models/clients.dart';
import 'package:business_repository/clients_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'src/entities/entities.dart';

class FirebaseClientsRepo implements ClientsRepository{
  final clientsRepository = FirebaseFirestore.instance.collection('clients');

  @override
  Future<void> createClient(Clients client) async{
    try {
      await clientsRepository
      .doc(client.clientId)
      .set(client.toEntity().toDocument());
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<List<Clients>> getClients() async{
    try {
      return await clientsRepository.get()
      .then((value)=> value.docs.map((e) =>
      Clients.fromEntity(ClientsEntity.fromDocument(e.data()))
      ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

}