

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Cubit/Get_States.dart';
import 'package:project/services/get_Prouducts.dart';

class GetProductCubit extends Cubit<ProductState> {
  final ProductService productService;

  GetProductCubit(this.productService) : super(ProductInitialState()) {
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      final products = await productService.fetchProducts();
      emit(ProductLoadedState(products));
    } catch (e) {
      emit(ProductFailureState());
    }
  }
}
