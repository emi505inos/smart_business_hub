import 'package:business_repository/src/models/models.dart';

abstract class SupliersRepository {
  
  Future<void> createSuplier(Suplier suplier);

  Future<List<Suplier>> getSuplier();
}