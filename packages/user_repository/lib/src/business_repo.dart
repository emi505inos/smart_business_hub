import 'package:user_repository/src/models/models.dart';



abstract class BusinessRepository1 {
  // Future<void> createBusiness(Business1 business);
  Future<void> setBusiness(String userId, Business1 business);
  // Future<List<Business1>> getBusiness();
}