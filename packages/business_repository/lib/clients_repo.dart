import 'src/models/models.dart';

abstract class ClientsRepository {
  Future<void> createClient(Clients client);

  Future<List<Clients>> getClients();

}