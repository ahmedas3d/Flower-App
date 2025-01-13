import 'package:flower_app/features/AuthFeature/presentation/view/screens/login_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/sign_up_screen.dart';
import 'package:flower_app/features/BestSeller/view/screens/best_seller_screen.dart';
import 'package:flower_app/features/Home/view/screens/home_screen.dart';
import 'package:flower_app/features/Home/view/widgets/bottom_nav_bar.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/email_verify_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/forgot_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/reset_password_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_cubit.dart';
import 'package:flower_app/features/Occasion/view/screens/occasion_screen.dart';
import 'package:flower_app/features/ProductDetails/view/screens/product_details_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/change-password_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/my_order_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/notification_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/profile_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/profile_edit_screen.dart';
import 'package:flower_app/features/SplashScreen/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String splash = '/';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String emailVerificationScreen = '/emailVerificationScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String homeScreen = '/homeScreen';
  static const String bottomNavBar = '/bottomNavBar';
  static const String bestSellerScreen = '/bestSellerScreen';
  static const String productDetails = '/productDetails';
  static const String occasionScreen = '/occasionScreen';
  static const String profileScreen = '/profileScreen';
  static const String profileEdit = '/profileEdit';
  static const String changePassword = '/changePassword';
  static const String notificationScreen = '/notificationScreen';
  static const String myOrderScreen = '/myOrderScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case splash:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: LoginScreen(),
                ));
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const SignUpScreen(),
                ));
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
      case bestSellerScreen:
        return MaterialPageRoute(builder: (_) => const BestSellerScreen());
      case productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
      case occasionScreen:
        return MaterialPageRoute(builder: (_) => const OccasionScreen());
      case profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case profileEdit:
        return MaterialPageRoute(builder: (_) => ProfileEditScreen());
      case changePassword:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
      case notificationScreen:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case myOrderScreen:
        return MaterialPageRoute(builder: (_) => MyOrderScreen());
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
