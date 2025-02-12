import 'package:dio/dio.dart';

import '../model/categorie.dart';

class GetAllCategores {
  //https://flower.elevateegy.com/api/v1/categories
  final Dio dio = Dio();
  Future<Response> getAllCategores() async {
    final response =
        await dio.get('https://flower.elevateegy.com/api/v1/categories');
    print(response.statusCode);
    return response;
  }
}
