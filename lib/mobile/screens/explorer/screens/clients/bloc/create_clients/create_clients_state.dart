part of 'create_clients_bloc.dart';

sealed class CreateClientsState extends Equatable {
  const CreateClientsState();
  
  @override
  List<Object> get props => [];
}

final class CreateClientsInitial extends CreateClientsState {}
final class CreateClientsLoading extends CreateClientsState {}
final class CreateClientsSuccess extends CreateClientsState {}
final class CreateClientsFailure extends CreateClientsState {}

