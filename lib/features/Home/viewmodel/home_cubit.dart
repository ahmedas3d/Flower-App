import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/product/get_all_product_model.dart';
import '../data/services/get_all_product_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getAllProducts() async {
    emit(HomeLoading());
    try {
      final products = await homeServiceAPI.getAllProducts();
      emit(HomeLoaded(products: products));
    } catch (e) {
      emit(HomeError(error: e.toString()));
    }
  }
}
