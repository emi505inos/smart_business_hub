part of 'get_employee_bloc.dart';

sealed class GetEmployeeEvent extends Equatable {
  const GetEmployeeEvent();

  @override
  List<Object> get props => [];
}

class GetEmployee extends GetEmployeeEvent{}