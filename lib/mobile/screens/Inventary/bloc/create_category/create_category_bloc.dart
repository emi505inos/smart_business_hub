import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final CategoryRepository categoryRepository;
  CreateCategoryBloc(this.categoryRepository) : super(CreateCategoryInitial()) {
    on<CreateCategory>((event, emit) async{
      emit(CreateCategoryLoading());
      try {
        await categoryRepository.createCategory(event.category);
        emit(CreateCategorySuccess());
      } catch (e) {
        emit(CreateCategoryFailure());
      }
    });
  }
}
