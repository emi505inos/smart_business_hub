part of 'get_clients_bloc.dart';

sealed class GetClientsEvent extends Equatable {
  const GetClientsEvent();

  @override
  List<Object> get props => [];
}

class GetClients extends GetClientsEvent{}