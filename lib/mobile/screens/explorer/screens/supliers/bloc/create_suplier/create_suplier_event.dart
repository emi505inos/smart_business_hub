part of 'create_suplier_bloc.dart';

sealed class CreateSuplierEvent extends Equatable {
  const CreateSuplierEvent();

  @override
  List<Object> get props => [];
}

class CreateSuplier extends CreateSuplierEvent{
  final Suplier suplier;
  
  const CreateSuplier(this.suplier);

  @override
  List<Object> get props => [suplier];
}