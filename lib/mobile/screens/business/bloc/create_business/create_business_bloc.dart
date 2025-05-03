import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'create_business_event.dart';
part 'create_business_state.dart';

class CreateBusinessBloc extends Bloc<CreateBusinessEvent, CreateBusinessState> {
  final BusinessRepository businessRepository;
  CreateBusinessBloc(this.businessRepository) : super(CreateBusinessInitial()) {
    on<CreateBusiness>((event, emit) async{
      emit(CreateBusinessLoading());
      try {
        await businessRepository.createBusiness(event.business);
        emit(CreateBusinessSuccess());
      } catch (e) {
        emit(CreateBusinessFailure());
      }
    });
  }
}
