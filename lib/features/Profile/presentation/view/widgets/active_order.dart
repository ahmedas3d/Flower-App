import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ActiveOrder extends StatelessWidget {
  const ActiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة بيانات الطلبات
    final orders = [
      {
        "name": "Bouquet of Roses",
        "price": "EGP 1,500",
        "orderNumber": "123456",
      },
      {
        "name": "Lily Bouquet",
        "price": "EGP 2,000",
        "orderNumber": "654321",
      },
      {
        "name": "Tulip Arrangement",
        "price": "EGP 1,800",
        "orderNumber": "987654",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: ActiveOrderItem(
                name: order["name"]!,
                price: order["price"]!,
                orderNumber: order["orderNumber"]!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ActiveOrderItem extends StatelessWidget {
  final String name;
  final String price;
  final String orderNumber;

  const ActiveOrderItem({
    super.key,
    required this.name,
    required this.price,
    required this.orderNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.greyColor),
      ),
      child: Row(
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              color: AppColors.pinkLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/best-seller4.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textColor1,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textColor1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Order number# $orderNumber',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textColor3,
                  ),
                ),
                const Spacer(),
                customButton(
                  title: S.of(context).trackOrder,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.trackOrders);
                  },
                  color: AppColors.primaryColor,
                  textColor: Colors.white,
                  size: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
