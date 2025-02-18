import 'package:bloc/bloc.dart';
import 'package:flower_app/features/Home/data/models/product/get_all_product_model.dart';
import 'package:meta/meta.dart';

import '../data/service/get_all_products.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final GetAllProducts _getAllProducts = GetAllProducts();

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    try {
      final products = await _getAllProducts.getAllProducts();
      List<ProductModel> productsList = [];
      for (var product in products.data['products']) {
        productsList.add(ProductModel.fromJson(product));
      }
      emit(ProductsLoaded(products: productsList));
    } catch (e) {
      emit(ProductsError(message: e.toString()));
    }
  }
}
