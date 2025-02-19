import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';

class NoProductsInCategories extends StatelessWidget {
  const NoProductsInCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/no-product.png',
              width: 350,
              height: 350,
              fit: BoxFit.contain,
            ),
            const Text(
              'No Products In Category',
              style: TextStyle(
                color: AppColors.textColor1,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
