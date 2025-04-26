import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'get_income_event.dart';
part 'get_income_state.dart';

class GetIncomeBloc extends Bloc<GetIncomeEvent, GetIncomeState> {
  IncomeRepository incomeRepository;

  GetIncomeBloc(this.incomeRepository) : super(GetIncomeInitial()) {
    on<GetIncome>((event, emit) async{
      emit(GetIncomeLoading());
      try {
        List<Income> incomes = await incomeRepository.getIncome();
        emit(GetIncomeSuccess(incomes));
      } catch (e) {
        emit(GetIncomeFailure());
      }
    });
  }
}
