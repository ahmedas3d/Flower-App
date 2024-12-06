import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final dio = Dio(); // Dio for HTTP requests

  void signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required String rePassword,
    required String gender,
  }) async {
    emit(SignUpLoadingState()); // Emit loading state

    try {
      var response = await Dio().post(
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
        options: Options(
          headers: {
            "Content-Type": "application/json", // Ensure proper content type
          },
        ),
      );

      // Handle successful response
      if (response.statusCode == 201) {
        emit(SignUpSuccessState());
        print('Signup successful: ${response.data}');
      } else {
        emit(SignUpErrorState(
            error: "Unexpected error: ${response.statusCode}"));
      }
    } catch (e) {
      // Catch Dio errors
      if (e is DioError) {
        print('DioError: ${e.response?.data ?? e.message}');
        emit(SignUpErrorState(error: e.response?.data.toString() ?? e.message));
      } else {
        // Handle generic errors
        print('Error: $e');
        emit(SignUpErrorState(error: e.toString()));
      }
    }
  }

  void signIn({required String email, required String password}) async {
    emit(SignInLoadingState()); // Emit loading state

    try {
      var response = await dio.post(
        'https://flower.elevateegy.com/api/v1/auth/signin', // Example API endpoint for login
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json", // Ensure proper content type
          },
        ),
      );

      if (response.statusCode == 200) {
        emit(SignInSuccessState()); // Emit success state on successful login
      } else {
        emit(SignInErrorState(error: "Error in login"));
      }
      //catch errors with Dio
    } catch (e /* DioError */) {
      emit(SignInErrorState(
          error: e.toString())); // Emit error state if something goes wrong
    }
  }

  void signOut() {
    emit(SignOutState()); // Emit sign-out state
  }
}
