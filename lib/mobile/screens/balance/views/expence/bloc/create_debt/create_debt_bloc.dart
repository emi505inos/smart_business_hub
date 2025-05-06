import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'create_debt_event.dart';
part 'create_debt_state.dart';

class CreateDebtBloc extends Bloc<CreateDebtEvent, CreateDebtState> {
  final DebtsRepository debtsRepository;

  CreateDebtBloc( this.debtsRepository) : super(CreateDebtInitial()) {
    on<CreateDebt>((event, emit) async{
      emit(CreateDebtLoading());
      try {
        await debtsRepository.createDebts(event.debts);
        emit(CreateDebtSuccess());
      } catch (e) {
        emit(CreateDebtFailure());
      }
    });
  }
}
