import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoProductInCart extends StatelessWidget {
  const NoProductInCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://lottie.host/d1a9b2a4-4f9b-45f7-b5d8-658e85ae60a9/uSGlbrONDe.json',
              ),
              const SizedBox(height: 20),
              Text(
                S.of(context).noProductInCart,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).emptyCart,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor3,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
