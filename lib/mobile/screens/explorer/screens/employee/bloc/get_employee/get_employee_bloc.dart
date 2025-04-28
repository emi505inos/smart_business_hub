import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'get_employee_event.dart';
part 'get_employee_state.dart';

class GetEmployeeBloc extends Bloc<GetEmployeeEvent, GetEmployeeState> {
  final EmployeeRepository employeeRepository;

  GetEmployeeBloc(this.employeeRepository) : super(GetEmployeeInitial()) {
    on<GetEmployee>((event, emit) async{
      emit(GetEmployeeLoading());
      try {
        List<Employee> employee = await employeeRepository.getEmployee();
        emit(GetEmployeeSuccess(employee));
      } catch (e) {
        emit(GetEmployeeFailure());
      }
    });
  }
}
