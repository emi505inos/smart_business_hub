part of 'get_income_bloc.dart';

sealed class GetIncomeState extends Equatable {
  const GetIncomeState();
  
  @override
  List<Object> get props => [];
}

final class GetIncomeInitial extends GetIncomeState {}

final class GetIncomeFailure extends GetIncomeState {}
final class GetIncomeLoading extends GetIncomeState {}
final class GetIncomeSuccess extends GetIncomeState {
  final List<Income> incomes;

  const GetIncomeSuccess(this.incomes);

  @override
  List<Object> get props => [incomes];

}

