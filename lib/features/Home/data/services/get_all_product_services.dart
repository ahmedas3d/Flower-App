import 'package:flower_app/core/api/api.dart';
import 'package:flower_app/features/Home/data/models/get_all_product_model.dart';

class AllProductServices {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://flower.elevateegy.com/api/v1/products');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
