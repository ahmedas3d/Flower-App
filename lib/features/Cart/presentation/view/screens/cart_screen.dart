import 'package:flower_app/features/Cart/presentation/view/widgets/checkout_summry.dart';
import 'package:flower_app/features/Home/view/widgets/custom_row_address.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/Cart/presentation/view/widgets/product_in_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int total = 0; // الـ Total يتم تحديثه هنا
  int itemsCount = 0; // عدد العناصر في السلة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        title: Row(
          children: [
            Text(
              S.of(context).cart,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor1,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '($itemsCount items)', // عرض عدد العناصر هنا
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textColor3,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const CustomRowAddress(), // عنصر العنوان
            ProductInCart(
              onTotalChanged: (newTotal) {
                setState(() {
                  total = newTotal; // تحديث الـ Total
                });
              },
              onItemsCountChanged: (newItemsCount) {
                setState(() {
                  itemsCount = newItemsCount; // تحديث عدد العناصر
                });
              },
            ),
            CheckoutSummary(
                total: total), // تمرير الـ Total إلى CheckoutSummary
          ],
        ),
      ),
    );
  }
}
