import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'get_clients_event.dart';
part 'get_clients_state.dart';

class GetClientsBloc extends Bloc<GetClientsEvent, GetClientsState> {
  final ClientsRepository clientsRepository;
  GetClientsBloc(this.clientsRepository) : super(GetClientsInitial()) {
    on<GetClients>((event, emit) async{
      emit(GetClientsLoading());
      try {
        List<Clients> clients = await clientsRepository.getClients();
      emit(GetClientsSuccess(clients));
      } catch (e) {
        emit(GetClientsFailure());
      }
    });
  }
}
