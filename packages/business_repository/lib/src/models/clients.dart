import 'package:uuid/uuid.dart';

import '../entities/entities.dart';

class Clients {
  String clientId;
  String name;
  String phone;

  Clients({
    required this.clientId,
    required this.name,
    required this.phone,
  });
  static final empty = Clients(
    clientId: Uuid().v1(),
    name: '',
    phone: '',
  );
  ClientsEntity toEntity() {
    return ClientsEntity(
      clientId: clientId,
      name: name,
      phone: phone,
    );
  }
  static Clients fromEntity(ClientsEntity entity) {
    return Clients(
      clientId: entity.clientId,
      name: entity.name,
      phone: entity.phone,
    );
  }
}