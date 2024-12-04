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
      var response = await dio.post(
        'https://elevate-tech.com/api/auth/register', // Example API endpoint
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": '+20$phone',
        },
      );

      if (response.statusCode == 200) {
        emit(SignUpSuccessState()); // Emit success state on successful signup
      } else {
        emit(SignUpErrorState(error: "Error in signup"));
      }
    } catch (e) {
      emit(SignUpErrorState(
          error: e.toString())); // Emit error state if something goes wrong
    }
  }

  void signIn({required String email, required String password}) async {
    emit(SignInLoadingState()); // Emit loading state

    try {
      var response = await dio.post(
        'https://elevate-tech.com/api/auth/login', // Example API endpoint for login
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        emit(SignInSuccessState()); // Emit success state on successful login
      } else {
        emit(SignInErrorState(error: "Error in login"));
      }
    } catch (e) {
      emit(SignInErrorState(
          error: e.toString())); // Emit error state if something goes wrong
    }
  }

  void signOut() {
    emit(SignOutState()); // Emit sign-out state
  }
}
