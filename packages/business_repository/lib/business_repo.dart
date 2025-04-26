import 'src/models/models.dart';

abstract class BusinessRepository {
  Future<void> createBusiness(Business business);

  Future<List<Business>> getBusiness();
}