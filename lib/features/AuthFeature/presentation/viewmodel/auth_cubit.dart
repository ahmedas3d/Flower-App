import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final dio = Dio(); // Dio for HTTP requests
  FirebaseAuth _user = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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
          await _user.createUserWithEmailAndPassword(
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
      await _user.signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignInErrorState(error: e.message ?? e.toString()));
    } catch (e) {
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
      _user.currentUser!.reload();
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

  void signInWithGoogle() async {
    emit(google_auth_loading());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      emit(google_auth_success());
    } catch (e) {
      emit(google_auth_error(error: e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    // if (_emailController.text.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("يرجى إدخال البريد الإلكتروني")),
    //   );
    //   return;
    // }
    emit(resetPassword_loading());
    try {
      await _user.sendPasswordResetEmail(email: email);
      emit(resetPassword_success());
      //show success message
    } catch (e) {
      emit(resetPassword_error(error: e.toString()));
      //show error message
    }
  }
}
