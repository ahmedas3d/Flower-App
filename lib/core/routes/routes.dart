import 'package:flower_app/features/AuthFeature/presentation/view/screens/email_verify_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/forgot_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/login_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/reset_password_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/sign_up_screen.dart';
import 'package:flower_app/features/SplashScreen/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String emailVerificationScreen = '/emailVerificationScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String homeScreen = '/homeScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case splash:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotScreen());
      case emailVerificationScreen:
        return MaterialPageRoute(builder: (_) => const EmailVerifyScreen());
      case resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
