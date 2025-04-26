import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'create_income_event.dart';
part 'create_income_state.dart';

class CreateIncomeBloc extends Bloc<CreateIncomeEvent, CreateIncomeState> {
  final IncomeRepository incomeRepository;
  
  CreateIncomeBloc(this.incomeRepository) : super(CreateIncomeInitial()) {
    on<CreateIncome>((event, emit) async{
      emit(CreateIncomeLoading());
      try {
        await incomeRepository.createIncome(event.income);
        emit(CreateIncomeSuccess());
      } catch (e) {
        emit(CreateIncomeFailure());
      }
    });
  }
}
