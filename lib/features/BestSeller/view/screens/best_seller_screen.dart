import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/BestSeller/view/widgets/custom_app_bar.dart';
import 'package:flower_app/features/BestSeller/view/widgets/products_list.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12, top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: S.of(context).bestSellers,
              subTitle: S.of(context).bloom,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ProductsList(),
            ),
          ],
        ),
      ),
    );
  }
}
