part of 'create_business_bloc.dart';

sealed class CreateBusinessEvent extends Equatable {
  const CreateBusinessEvent();

  @override
  List<Object> get props => [];
}

class CreateBusiness extends CreateBusinessEvent{
  final Business business;

  const CreateBusiness(this.business);
  
  @override
  List<Object> get props => [business];

}