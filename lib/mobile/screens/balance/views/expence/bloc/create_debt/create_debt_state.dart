part of 'create_debt_bloc.dart';

sealed class CreateDebtState extends Equatable {
  const CreateDebtState();
  
  @override
  List<Object> get props => [];
}

final class CreateDebtInitial extends CreateDebtState {}
final class CreateDebtFailure extends CreateDebtState {}
final class CreateDebtLoading extends CreateDebtState {}
final class CreateDebtSuccess extends CreateDebtState {}

