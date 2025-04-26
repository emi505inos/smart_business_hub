import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'create_expense_event.dart';
part 'create_expense_state.dart';

class CreateExpenseBloc extends Bloc<CreateExpenseEvent, CreateExpenseState> {
  final ExpenseRepository expenseRepository;
  CreateExpenseBloc(this.expenseRepository) : super(CreateExpenseInitial()) {
    on<CreateExpense>((event, emit) async {
      emit(CreateExpenseLoading());
      try {
        await expenseRepository.createExpense(event.expense);
        emit(CreateExpenseLoading());
      } catch (e) {
        emit(CreateExpenseFailure());
      }
    });
    
  }
}
