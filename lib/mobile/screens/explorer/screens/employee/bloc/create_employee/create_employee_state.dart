part of 'create_employee_bloc.dart';

sealed class CreateEmployeeState extends Equatable {
  const CreateEmployeeState();
  
  @override
  List<Object> get props => [];
}

final class CreateEmployeeInitial extends CreateEmployeeState {}
final class CreateEmployeeFailure extends CreateEmployeeState {}
final class CreateEmployeeLoading extends CreateEmployeeState {}
final class CreateEmployeeSuccess extends CreateEmployeeState {}

