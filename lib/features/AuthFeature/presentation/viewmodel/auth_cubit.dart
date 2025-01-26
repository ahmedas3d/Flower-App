import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final dio = Dio(); // Dio for HTTP requests
  FirebaseAuth user = FirebaseAuth.instance;
  late String _email;
  late String _password;
  void signUp({
    required String firstName,
    required String lastName,
    required String phone,
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
          "email": _email,
          "password": _password,
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
        print('Signup successful: ${response.data}');
        print("using firebase to create acoount");
        try {
          await user.createUserWithEmailAndPassword(
              email: _email, password: _password);
        } catch (e) {
          emit(SignUpErrorState(error: "firebase error: ${e.toString()}"));
        }
        emit(SignUpSuccessState());
      } else {
        emit(SignUpErrorState(
            error: "Unexpected error: ${response.statusCode}"));
      }
    } on DioError catch (e) {
      print('DioError: ${e.response?.data ?? e.message}');
      emit(SignUpErrorState(error: e.response?.data.toString() ?? e.message));
    } catch (e) {
      // Handle generic errors
      print('Error: $e');
      emit(SignUpErrorState(error: e.toString()));
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
        //using the error message from the server
        emit(SignInErrorState(error: response.data['message']));
      }
      //catch errors with Dio
    } on DioError catch (e) {
      print('DioError: ${e.response?.data ?? e.message}');
      emit(SignInErrorState(error: e.response?.data.toString() ?? e.message));
    } catch (e) {
      // Handle generic errors
      print('Error: $e');
      emit(SignInErrorState(error: e.toString()));
    }
  }

  void signOut() {
    emit(SignOutState()); // Emit sign-out state
  }

  Future<void> verify_email() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> checker_email() async {
    try {
      user.currentUser!.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        emit(verfiyEmailState_success());
      } else {
        emit(verfiyEmailState_error(error: "Please verify your email"));
      }
    } on Exception catch (e) {
      emit(verfiyEmailState_error(error: e.toString()));
    }
  }

  void setEmailandpassword(String textemail, String textpassword) {
    _email = textemail;
    _password = textpassword;
  }

  String getemail() {
    return _email;
  }

  String getpassword() {
    return _password;
  }
}
