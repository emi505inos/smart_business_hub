part of 'get_suplier_bloc.dart';

sealed class GetSuplierEvent extends Equatable {
  const GetSuplierEvent();

  @override
  List<Object> get props => [];
}

class GetSuplier extends GetSuplierEvent{}