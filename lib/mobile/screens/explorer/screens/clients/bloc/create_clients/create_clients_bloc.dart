import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'create_clients_event.dart';
part 'create_clients_state.dart';

class CreateClientsBloc extends Bloc<CreateClientsEvent, CreateClientsState> {
  final ClientsRepository clientsRepository;
  CreateClientsBloc(this.clientsRepository) : super(CreateClientsInitial()) {
    on<CreateClient>((event, emit) async{
      emit(CreateClientsLoading());
      try {
        await clientsRepository.createClient(event.clients);
        emit(CreateClientsSuccess());
      } catch (e) {
        emit(CreateClientsFailure());
      }
    });
  }
}
