import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final ProductRepository productRepository;
  CreateProductBloc(this.productRepository) : super(CreateProductInitial()) {
    on<CreateProduct>((event, emit) async{
      emit(CreateProductLoading());
      try {
        await productRepository.createProduct(event.product);
      emit(CreateProductSuccess());
      } catch (e) {
        emit(CreateProductFailure());
      }
    });
  }
}
