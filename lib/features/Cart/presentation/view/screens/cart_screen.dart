import 'package:flower_app/features/Home/data/models/product/get_all_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/product_trager/product_trager_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../AuthFeature/presentation/view/widgets/custom_button.dart';
import '../../../../Home/view/widgets/custom_row_address.dart';
import '../widgets/checkout_summry.dart';
import '../widgets/product_in_cart.dart';
import 'no_product_in_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int total = 0; // الـ Total يتم تحديثه هنا
  int itemsCount = 0; // عدد العناصر في السلة
  List<ProductModel> items = [];
  @override
  void initState() {
    super.initState();
    items = context.read<ProductTragerCubit>().productTrager;
    print('Items in cart: ${items.length}');
    for (var i in items) {
      print(i.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const NoProductInCart()
        : Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.backgroundColor,
              title: Row(
                children: [
                  Text(
                    S.of(context).cart,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor1,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '($itemsCount items)', // عرض عدد العناصر هنا
                    style: const TextStyle(
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

                  // Checkout Button
                  customButton(
                    title: S.of(context).checkout,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.checkOutScreen);
                    },
                    color: AppColors.primaryColor,
                    textColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          );
  }
}
