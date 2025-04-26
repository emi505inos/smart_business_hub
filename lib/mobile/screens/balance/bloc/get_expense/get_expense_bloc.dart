import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'get_expense_event.dart';
part 'get_expense_state.dart';

class GetExpenseBloc extends Bloc<GetExpenseEvent, GetExpenseState> {
  ExpenseRepository expenseRepository;

  GetExpenseBloc(this.expenseRepository) : super(GetExpenceInitial()) {
    on<GetExpense>((event, emit) async {
      emit(GetExpenseLoading());
      try {
        List<Expense> incomes = await expenseRepository.getExpenses();
        emit(GetExpenseSuccess(incomes));
      } catch (e) {
        emit(GetExpenseFailure());
      }
    });
  }
}
