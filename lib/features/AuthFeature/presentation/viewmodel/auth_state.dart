abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpErrorState extends AuthState {
  final String error;
  SignUpErrorState({required this.error});
}

class SignInLoadingState extends AuthState {}

class SignInSuccessState extends AuthState {}

class SignInErrorState extends AuthState {
  final String error;
  SignInErrorState({required this.error});
}

class SignOutState extends AuthState {}

class verfiyEmailState_success extends AuthState {}

class verfiyEmailState_error extends AuthState {
  final String error;
  verfiyEmailState_error({required this.error});
}
