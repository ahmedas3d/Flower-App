import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/Cart/presentation/view/widgets/checkout_summry.dart';
import 'package:flower_app/features/TrackOrder/presentation/view/widgets/address_container_track.dart';
import 'package:flower_app/features/TrackOrder/presentation/view/widgets/payment_container_track.dart';
import 'package:flower_app/features/TrackOrder/presentation/view/widgets/steps_orders.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderPlacedSuccessfully extends StatelessWidget {
  OrderPlacedSuccessfully({super.key});

  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Red roses',
      'subtitle': '15 Pink Rose Bouquet',
      'price': 'EGP 600',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Red roses',
      'subtitle': '15 Pink Rose Bouquet',
      'price': 'EGP 600',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Red roses',
      'subtitle': '15 Pink Rose Bouquet',
      'price': 'EGP 600',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/successfully.svg',
                height: 50,
                width: 50,
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).orderSuccess,
                style: TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15),
              StepsOrders(
                isGreenList: [true, false, false, false],
              ),
              const SizedBox(height: 20),
              // العنوان وطريقة الدفع أولاً
              const AddressContainerTrack(),
              const SizedBox(height: 20),
              const PaymentContainerTrack(),
              const SizedBox(height: 20),
              // قائمة العناصر بعد الدفع
              _buildItemsSection(),
              const SizedBox(height: 15),
              // checkout summary
              CheckoutSummary(total: 100),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemsSection() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.textColor3,
                  size: 23,
                ),
                const SizedBox(width: 5),
                Text(
                  '3 Items',
                  style: TextStyle(
                    color: AppColors.textColor1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  _buildItemCard(context, items[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(BuildContext context, Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.pinkLight,
              image: DecorationImage(
                image: AssetImage(item['image']!),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    item['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.16,
                  ),
                  Text(
                    item['price']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greenColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                item['subtitle']!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
