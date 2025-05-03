part of 'create_credit_debt_bloc.dart';

sealed class CreateCreditDebtEvent extends Equatable {
  const CreateCreditDebtEvent();

  @override
  List<Object> get props => [];
}

class CreateCreditDebt extends CreateCreditDebtEvent{
  final CreditDebt creditDebt;

  const CreateCreditDebt(this.creditDebt);

  @override
  List<Object> get props => [creditDebt];
}
