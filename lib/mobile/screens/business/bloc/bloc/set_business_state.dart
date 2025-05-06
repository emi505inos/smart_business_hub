part of 'set_business_bloc.dart';

sealed class SetBusinessState extends Equatable {
  const SetBusinessState();
  
  @override
  List<Object> get props => [];
}

final class SetBusinessInitial extends SetBusinessState {}
class SetBusinessLoading extends SetBusinessState {}

class SetBusinessSuccess extends SetBusinessState {}

class SetBusinessFailure extends SetBusinessState {
  final String error;
  const SetBusinessFailure(this.error);
}
