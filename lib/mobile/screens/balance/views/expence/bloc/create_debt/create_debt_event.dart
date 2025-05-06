part of 'create_debt_bloc.dart';

sealed class CreateDebtEvent extends Equatable {
  const CreateDebtEvent();

  @override
  List<Object> get props => [];
}

class CreateDebt extends CreateDebtEvent{
  final Debts debts;

  const CreateDebt(this.debts);
  
  @override
  List<Object> get props => [debts];

}