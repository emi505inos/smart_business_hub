import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'create_suplier_event.dart';
part 'create_suplier_state.dart';

class CreateSuplierBloc extends Bloc<CreateSuplierEvent, CreateSuplierState> {
  final SupliersRepository supliersRepository;
  CreateSuplierBloc(this.supliersRepository) : super(CreateSuplierInitial()) {
    on<CreateSuplier>((event, emit) async{
      emit(CreateSuplierLoading());
      try {
        await supliersRepository.createSuplier(event.suplier);
        emit(CreateSuplierSuccess());
      } catch (e) {
        emit(CreateSuplierFailure());
      }
    });
  }
}
