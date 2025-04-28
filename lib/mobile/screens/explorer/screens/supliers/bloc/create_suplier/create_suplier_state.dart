part of 'create_suplier_bloc.dart';

sealed class CreateSuplierState extends Equatable {
  const CreateSuplierState();
  
  @override
  List<Object> get props => [];
}

final class CreateSuplierInitial extends CreateSuplierState {}
final class CreateSuplierFailure extends CreateSuplierState {}
final class CreateSuplierLoading extends CreateSuplierState {}
final class CreateSuplierSuccess extends CreateSuplierState {}

