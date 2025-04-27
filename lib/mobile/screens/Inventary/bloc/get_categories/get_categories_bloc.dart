import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'get_categories_event.dart';
part 'get_categories_state.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  final CategoryRepository categoryRepository;
  GetCategoriesBloc(this.categoryRepository) : super(GetCategoriesInitial()) {
    on<GetCategories>((event, emit) async{
      emit(GetCategoriesLoading());
      try {
        List<Category> category = await categoryRepository.getCategory();
        emit(GetCategoriesSuccess(category));
      } catch (e) {
        emit(GetCategoriesFailure());
      }
    });
  }
}
