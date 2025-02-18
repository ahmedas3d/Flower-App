import 'package:dio/dio.dart';

class Authapi {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;
  final String rePassword;
  final String gender;
  final dio = Dio();

  Authapi(this.email, this.password, this.firstName, this.lastName, this.phone,
      this.rePassword, this.gender);

  Future<Response> signUp() async {
    final response = await dio.post(
      'https://flower.elevateegy.com/api/v1/auth/signup',
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": '+20$phone',
        "gender": gender
      },
      options: Options(headers: {"Content-Type": "application/json"}),
    );
    return response;
  }

  Future<Response> signIn() async {
    final response = await dio.post(
      'https://flower.elevateegy.com/api/v1/auth/signin',
      data: {
        "email": email,
        "password": password,
      },
      options: Options(headers: {"Content-Type": "application/json"}),
    );
    return response;
  }
}
