import 'package:flower_app/features/Home/data/models/product/get_all_product_model.dart';

abstract class ProductTragerState {}

class ProductTragerInitial extends ProductTragerState {}

class ProductTragerLoading extends ProductTragerState {}

class ProductTragerSuccess extends ProductTragerState {
  final List<ProductModel> products;

  ProductTragerSuccess({required this.products});
}

class ProductTragerError extends ProductTragerState {
  final String message;

  ProductTragerError({required this.message});
}
