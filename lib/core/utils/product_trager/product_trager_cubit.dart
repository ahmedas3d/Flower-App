import 'package:bloc/bloc.dart';
import 'package:flower_app/features/Home/data/models/product/get_all_product_model.dart';

import 'product_trager_state.dart';

class ProductTragerCubit extends Cubit<ProductTragerState> {
  ProductTragerCubit() : super(ProductTragerInitial());
  List<ProductModel> productTrager = [];
  void addProductToCart(ProductModel product) async {
    emit(ProductTragerLoading());
    try {
      productTrager.add(product);
      print("Product added: ${product.title}");
      print("Current products: ${productTrager.map((p) => p.title).toList()}");

      emit(ProductTragerSuccess(products: List.from(productTrager)));
    } catch (e) {
      emit(ProductTragerError(
        message: e.toString(),
      ));
    }
  }
}
