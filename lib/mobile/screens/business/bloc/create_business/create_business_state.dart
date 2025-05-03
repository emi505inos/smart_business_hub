part of 'create_business_bloc.dart';

sealed class CreateBusinessState extends Equatable {
  const CreateBusinessState();
  
  @override
  List<Object> get props => [];
}

final class CreateBusinessInitial extends CreateBusinessState {}
final class CreateBusinessLoading extends CreateBusinessState {}
final class CreateBusinessFailure extends CreateBusinessState {}
final class CreateBusinessSuccess extends CreateBusinessState {}

