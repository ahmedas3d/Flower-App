import 'package:dio/dio.dart' show Dio, Response;

class GetAllProducts {
  //https://flower.elevateegy.com/api/v1/products
  final Dio dio = Dio();

  Future<Response<dynamic>> getAllProducts() async {
    final response =
        await dio.get('https://flower.elevateegy.com/api/v1/products');

    return response;
  }
}
