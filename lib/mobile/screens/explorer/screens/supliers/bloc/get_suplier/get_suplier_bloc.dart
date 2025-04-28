import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'get_suplier_event.dart';
part 'get_suplier_state.dart';

class GetSuplierBloc extends Bloc<GetSuplierEvent, GetSuplierState> {
  final SupliersRepository supliersRepository;

  GetSuplierBloc(this.supliersRepository) : super(GetSuplierInitial()) {
    on<GetSuplier>((event, emit) async{
      emit(GetSuplierLoading());
      try {
        List<Suplier> suplier = await supliersRepository.getSuplier();
        emit(GetSuplierSuccess(suplier));
      } catch (e) {
        emit(GetSuplierFailure());
      }
    });
  }
}
