import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'set_business_event.dart';
part 'set_business_state.dart';

class SetBusinessBloc extends Bloc<SetBusinessEvent, SetBusinessState> {
  final BusinessRepository1 businessRepository;

  SetBusinessBloc(this.businessRepository) : super(SetBusinessInitial()) {
    on<SetBusinessRequested>(_onSetBusinessRequested);
  }

  Future<void> _onSetBusinessRequested(
      SetBusinessRequested event, Emitter<SetBusinessState> emit) async {
    emit(SetBusinessLoading());

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      emit(SetBusinessFailure('Usuario no autenticado.'));
      return;
    }

    if (event.business.owner != user.uid) {
      emit(SetBusinessFailure('El usuario no es el dueño del negocio.'));
      return;
    }

    try {
      await businessRepository.setBusiness(user.uid, event.business);
      emit(SetBusinessSuccess());
    } catch (e) {
      emit(SetBusinessFailure(e.toString()));
    }
  }
}