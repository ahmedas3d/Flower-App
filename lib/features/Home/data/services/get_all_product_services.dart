import 'package:dio/dio.dart';
import 'package:flower_app/features/Home/data/models/get_all_product_model.dart';

class homeServiceAPI {
  static final dio = Dio();
  static Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> products = [];
    //https://flower.elevateegy.com/api/v1/home
    final response = await dio.get('https://flower.elevateegy.com/api/v1/home');
    for (var item in response.data['products']) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }
}
