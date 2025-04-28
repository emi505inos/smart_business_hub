part of 'create_employee_bloc.dart';

sealed class CreateEmployeeEvent extends Equatable {
  const CreateEmployeeEvent();

  @override
  List<Object> get props => [];
}

class CreateEmployee extends CreateEmployeeEvent{
  final Employee employee;

  const CreateEmployee(this.employee);

  @override
  List<Object> get props => [employee];
}
