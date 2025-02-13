import 'package:flower_app/features/Cart/presentation/view/screens/no_product_in_cart.dart';
import 'package:flower_app/features/Cart/presentation/view/widgets/checkout_summry.dart';
import 'package:flower_app/features/Cart/presentation/view/widgets/product_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/features/Home/data/models/product/get_all_product_model.dart';
import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/core/utils/product_trager/product_trager_cubit.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/Home/view/widgets/custom_row_address.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int total = 0; // الـ Total يتم تحديثه هنا
  int itemsCount = 0; // عدد العناصر في السلة
  List<ProductModel> items = [];

  Future<void> _refreshData() async {
    // قم بتحديث البيانات هنا
    setState(() {
      items = context.read<ProductTragerCubit>().productTrager;
      total = items.fold(0, (sum, item) => sum + (item.price ?? 0));
      itemsCount = items.length;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
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
            body: RefreshIndicator(
              onRefresh: _refreshData,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const CustomRowAddress(), // عنصر العنوان
                    ProductInCart(
                      products: items,
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
                      deliveryFee: 10,
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
            ),
          );
  }
}
