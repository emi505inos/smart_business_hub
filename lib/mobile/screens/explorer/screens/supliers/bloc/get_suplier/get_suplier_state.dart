part of 'get_suplier_bloc.dart';

sealed class GetSuplierState extends Equatable {
  const GetSuplierState();
  
  @override
  List<Object> get props => [];
}

final class GetSuplierInitial extends GetSuplierState {}
final class GetSuplierFailure extends GetSuplierState {}
final class GetSuplierLoading extends GetSuplierState {}
final class GetSuplierSuccess extends GetSuplierState {
  final List<Suplier> suplier;
  
  const GetSuplierSuccess(this.suplier);

  @override
  List<Object> get props => [suplier];
}

