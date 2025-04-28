part of 'create_clients_bloc.dart';

sealed class CreateClientsEvent extends Equatable {
  const CreateClientsEvent();

  @override
  List<Object> get props => [];
}

class CreateClient extends CreateClientsEvent{
  final Clients clients;

  const CreateClient(this.clients);

  @override
  List<Object> get props => [clients];
}