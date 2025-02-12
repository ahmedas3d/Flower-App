import 'package:bloc/bloc.dart';
import 'package:flower_app/features/Home/data/models/product/get_all_product_model.dart';
import 'package:meta/meta.dart';

part 'product_trager_state.dart';

class ProductTragerCubit extends Cubit<ProductTragerState> {
  ProductTragerCubit() : super(ProductTragerInitial());
  List<ProductModel> productTrager = [];

  void addProductToCart(ProductModel product) async {
    emit(ProductTragerLoading());
    try {
      productTrager.add(product);
      // final productTrager = await productTragerRepository.getProductTrager();
      emit(ProductTragerSuccess());
    } catch (e) {
      emit(ProductTragerError(
        message: e.toString(),
      ));
    }
  }

  void removeProduct(ProductModel product) async {
    emit(ProductTragerLoading());
    try {
      productTrager.remove(product);
      // final productTrager = await productTragerRepository.getProductTrager();
      emit(ProductTragerSuccess());
    } catch (e) {
      emit(ProductTragerError(
        message: e.toString(),
      ));
    }
  }

  void clearProduct() async {
    emit(ProductTragerLoading());
    try {
      productTrager.clear();
      // final productTrager = await productTragerRepository.getProductTrager();
      emit(ProductTragerSuccess());
    } catch (e) {
      emit(ProductTragerError(message: e.toString()));
    }
  }
}
