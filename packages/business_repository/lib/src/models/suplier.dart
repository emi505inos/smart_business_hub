import 'package:uuid/uuid.dart';

import '../entities/entities.dart';

class Suplier {
  String suplierId;
  String name;
  int phoneNumber;

  Suplier({
    required this.suplierId,
    required this.name,
    required this.phoneNumber,
  });
  static final empty = Suplier(
    suplierId: Uuid().v1(),
    name: '',
    phoneNumber: 0,
  );
  SuplierEntity toEntity() {
    return SuplierEntity(
      suplierId: suplierId,
      name: name,
      phoneNumber: phoneNumber,
    );
  }
  static Suplier fromEntity(SuplierEntity entity) {
    return Suplier(
      suplierId: entity.suplierId,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
    );
  }
}