import 'package:bloc/bloc.dart';
import 'package:business_repository/repositories.dart';
import 'package:equatable/equatable.dart';

part 'get_product_event.dart';
part 'get_product_state.dart';

class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
  final ProductRepository productRepository;
  GetProductBloc(this.productRepository) : super(GetProductInitial()) {
    on<GetProduct>((event, emit) async{
      emit(GetProductLoading());
      try {
        List<Product> product = await productRepository.getProduct();
        emit(GetProductSuccess(product));
      } catch (e) {
        emit(GetProductFailure());
      }
    });
  }
}
