import 'package:dio/dio.dart';

class GetAllCategores {
  //https://flower.elevateegy.com/api/v1/categories
  final Dio dio = Dio();
  Future<Response> getAllCategores() async {
    final response =
        await dio.get('https://flower.elevateegy.com/api/v1/categories');

    return response;
  }
}
