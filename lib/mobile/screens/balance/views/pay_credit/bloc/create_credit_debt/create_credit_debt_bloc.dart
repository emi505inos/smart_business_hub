import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'create_credit_debt_event.dart';
part 'create_credit_debt_state.dart';

class CreateCreditDebtBloc extends Bloc<CreateCreditDebtEvent, CreateCreditDebtState> {
  final CreditDebtRepository creditDebtRepository;
  CreateCreditDebtBloc(this.creditDebtRepository) : super(CreateCreditDebtInitial()) {
    on<CreateCreditDebt>((event, emit) async{
      emit(CreateCreditDebtLoading());
      try {
        await creditDebtRepository.createCreditDebt(event.creditDebt);
        emit(CreateCreditDebtSuccess());
      } catch (e) {
        emit(CreateCreditDebtFailure());
      }
    });
  }
}
