abstract class AuthState {}

class AuthInitial extends AuthState {}

// Sign Up States
class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpErrorState extends AuthState {
  final String error;
  SignUpErrorState({required this.error});
}

// Sign In States
class SignInLoadingState extends AuthState {}

class SignInSuccessState extends AuthState {}

class SignInErrorState extends AuthState {
  final String error;
  SignInErrorState({required this.error});
}

// Sign Out States
class SignOutState extends AuthState {}

class SignOutErrorState extends AuthState {
  final String error;
  SignOutErrorState({required this.error});
}

// Email Verification States
class VerifyEmailLoadingState extends AuthState {}

class VerifyEmailSentState extends AuthState {}

class VerifyEmailSuccessState extends AuthState {}

class VerifyEmailErrorState extends AuthState {
  final String error;
  VerifyEmailErrorState({required this.error});
}

// Google Sign-In States
class GoogleAuthLoadingState extends AuthState {}

class GoogleAuthSuccessState extends AuthState {}

class GoogleAuthErrorState extends AuthState {
  final String error;
  GoogleAuthErrorState({required this.error});
}

// Password Reset States
class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordErrorState extends AuthState {
  final String error;
  ResetPasswordErrorState({required this.error});
}
