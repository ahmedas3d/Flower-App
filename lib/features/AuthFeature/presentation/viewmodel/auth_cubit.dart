import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/service/authapi.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _user = FirebaseAuth.instance;
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
    emit(SignUpLoadingState());

    try {
      final response = await Authapi(
        _email,
        _password,
        firstName,
        lastName,
        phone,
        rePassword,
        gender,
      ).signUp();

      if (response.statusCode == 201) {
        try {
          await _user.createUserWithEmailAndPassword(
            email: _email,
            password: _password,
          );
          emit(SignUpSuccessState());
        } on FirebaseAuthException catch (e) {
          emit(SignUpErrorState(error: "Firebase error: ${e.message}"));
        }
      } else {
        emit(SignUpErrorState(
            error: "Unexpected error: ${response.statusCode}"));
      }
    } on DioError catch (e) {
      emit(SignUpErrorState(error: e.response?.data.toString() ?? e.message));
    } catch (e) {
      emit(SignUpErrorState(error: e.toString()));
    }
  }

  void signIn({required String email, required String password}) async {
    emit(SignInLoadingState());

    try {
      await _user.signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignInErrorState(error: e.message ?? "Authentication failed"));
    } catch (e) {
      emit(SignInErrorState(error: e.toString()));
    }
  }

  void signOut() async {
    try {
      await _user.signOut();
      await _googleSignIn.signOut();
      emit(SignOutState());
    } catch (e) {
      emit(SignOutErrorState(error: e.toString()));
    }
  }

  Future<void> verifyEmail() async {
    try {
      await _user.currentUser?.sendEmailVerification();
      emit(VerifyEmailSentState());
    } catch (e) {
      emit(VerifyEmailErrorState(error: e.toString()));
    }
  }

  void checkEmailVerification() async {
    try {
      await _user.currentUser?.reload();
      final user = _user.currentUser;
      if (user != null && user.emailVerified) {
        emit(VerifyEmailSuccessState());
      } else {
        emit(VerifyEmailErrorState(error: "Email not verified"));
      }
    } catch (e) {
      emit(VerifyEmailErrorState(error: e.toString()));
    }
  }

  void setEmailAndPassword(String email, String password) {
    _email = email;
    _password = password;
  }

  void signInWithGoogle() async {
    emit(GoogleAuthLoadingState());
    // i need to clean the cache
    await _googleSignIn.signOut();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _user.signInWithCredential(credential);
      emit(GoogleAuthSuccessState());
    } catch (e) {
      emit(GoogleAuthErrorState(error: e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoadingState());
    try {
      await _user.sendPasswordResetEmail(email: email);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordErrorState(error: e.toString()));
    }
  }

  String? getCurrentUserEmail() {
    return _user.currentUser?.email;
  }

  User? getCurrentUser() {
    return _user.currentUser;
  }
}
