import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(
        const Duration(milliseconds: 2800)); // Delay for 2.8 seconds
    Navigator.pushReplacementNamed(
        context, AppRoutes.loginScreen); // Navigate to the home screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(
          'assets/images/splash.gif', // Path to your GIF
          width: 269,
          height: 474,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
