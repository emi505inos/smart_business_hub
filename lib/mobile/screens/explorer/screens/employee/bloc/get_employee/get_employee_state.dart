part of 'get_employee_bloc.dart';

sealed class GetEmployeeState extends Equatable {
  const GetEmployeeState();
  
  @override
  List<Object> get props => [];
}

final class GetEmployeeInitial extends GetEmployeeState {}
final class GetEmployeeFailure extends GetEmployeeState {}
final class GetEmployeeLoading extends GetEmployeeState {}
final class GetEmployeeSuccess extends GetEmployeeState {
  final List<Employee> employee;

  const GetEmployeeSuccess(this.employee);
  
  @override
  List<Object> get props => [employee];
}

