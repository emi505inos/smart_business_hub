part of 'create_credit_debt_bloc.dart';

sealed class CreateCreditDebtState extends Equatable {
  const CreateCreditDebtState();
  
  @override
  List<Object> get props => [];
}

final class CreateCreditDebtInitial extends CreateCreditDebtState {}
final class CreateCreditDebtFailure extends CreateCreditDebtState {}
final class CreateCreditDebtLoading extends CreateCreditDebtState {}
final class CreateCreditDebtSuccess extends CreateCreditDebtState {}

