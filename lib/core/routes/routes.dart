import 'package:flower_app/features/AuthFeature/presentation/view/screens/email_verify_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/forgot_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/login_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/reset_password_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/screens/sign_up_screen.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_cubit.dart';
import 'package:flower_app/features/BestSeller/view/screens/best_seller_screen.dart';
import 'package:flower_app/features/Cart/presentation/view/screens/cart_screen.dart';
import 'package:flower_app/features/Checkout/presentation/view/screens/check_out_screen.dart';
import 'package:flower_app/features/Home/view/screens/home_screen.dart';
import 'package:flower_app/features/Home/view/widgets/bottom_nav_bar.dart';
import 'package:flower_app/features/Occasion/view/screens/occasion_screen.dart';
import 'package:flower_app/features/ProductDetails/view/screens/product_details_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/about_us.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/add_address.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/change-password_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/my_order_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/notification_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/profile_edit_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/profile_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/saved_address.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/terms_and_conditions.dart';
import 'package:flower_app/features/SplashScreen/view/screen/splash_screen.dart';
import 'package:flower_app/features/TrackOrder/presentation/view/screens/order_placed_successfully.dart';
import 'package:flower_app/features/TrackOrder/presentation/view/screens/show_map_screen.dart';
import 'package:flower_app/features/TrackOrder/presentation/view/screens/track_orders.dart';
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
  static const String savedAddress = '/savedAddress';
  static const String addAddress = '/addAddress';
  static const String cartScreen = '/cartScreen';
  static const String aboutScreen = '/aboutScreen';
  static const String tremsAndConditionView = '/tremsAndConditionView';
  static const String checkOutScreen = '/checkOutScreen';
  static const String trackOrders = '/trackOrders';
  static const String trackingScreen = '/trackingScreen';

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
                  child: SignUpScreen(),
                ));
      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotScreen());
      case emailVerificationScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const EmailVerifyScreen(),
                ));
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
      case savedAddress:
        return MaterialPageRoute(builder: (_) => SavedAddress());
      case addAddress:
        return MaterialPageRoute(builder: (_) => AddAddress());
      case cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case aboutScreen:
        return MaterialPageRoute(builder: (_) => AboutScreen());
      case tremsAndConditionView:
        return MaterialPageRoute(builder: (_) => TermsAndConditionsView());
      case checkOutScreen:
        return MaterialPageRoute(builder: (_) => CheckOutScreen());
      case trackOrders:
        return MaterialPageRoute(builder: (_) => TrackOrders());
      case trackingScreen:
        return MaterialPageRoute(builder: (_) => TrackingScreen());
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
