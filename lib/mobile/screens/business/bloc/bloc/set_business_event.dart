part of 'set_business_bloc.dart';

sealed class SetBusinessEvent extends Equatable {
  const SetBusinessEvent();

  @override
  List<Object> get props => [];
}

class SetBusinessRequested extends SetBusinessEvent {
  final Business1 business;

  const SetBusinessRequested(this.business);
}