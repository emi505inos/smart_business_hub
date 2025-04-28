import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'create_employee_event.dart';
part 'create_employee_state.dart';

class CreateEmployeeBloc extends Bloc<CreateEmployeeEvent, CreateEmployeeState> {
  final EmployeeRepository employeeRepository;

  CreateEmployeeBloc(this.employeeRepository) : super(CreateEmployeeInitial()) {
    on<CreateEmployee>((event, emit) async{
      emit(CreateEmployeeLoading());
      try {
        await employeeRepository.createEmployee(event.employee);
        emit(CreateEmployeeSuccess());
      } catch (e) {
        emit(CreateEmployeeFailure());
      }
    });
  }
}
