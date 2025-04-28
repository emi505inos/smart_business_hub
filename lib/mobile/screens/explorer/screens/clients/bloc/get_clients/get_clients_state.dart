part of 'get_clients_bloc.dart';

sealed class GetClientsState extends Equatable {
  const GetClientsState();
  
  @override
  List<Object> get props => [];
}

final class GetClientsInitial extends GetClientsState {}
final class GetClientsFailure extends GetClientsState {}
final class GetClientsLoading extends GetClientsState {}
final class GetClientsSuccess extends GetClientsState {
  final List<Clients> clients;

  const GetClientsSuccess(this.clients);

  @override
  List<Object> get props => [clients];
}

