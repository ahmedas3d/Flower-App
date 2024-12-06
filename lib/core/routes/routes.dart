import 'package:flower_app/features/AuthFeature/view/screens/email_verify_screen.dart';
import 'package:flower_app/features/AuthFeature/view/screens/forgot_screen.dart';
import 'package:flower_app/features/AuthFeature/view/screens/login_screen.dart';
import 'package:flower_app/features/AuthFeature/view/screens/reset_password_screen.dart';
import 'package:flower_app/features/AuthFeature/view/screens/sign_up_screen.dart';
import 'package:flower_app/features/Home/view/screens/home_screen.dart';
import 'package:flower_app/features/Home/view/widgets/bottom_nav_bar.dart';
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
  static const String bottomNavBar = '/bottomNavBar';

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
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());
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
