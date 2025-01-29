import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/Cart/presentation/view/widgets/checkout_summry.dart';
import 'package:flower_app/features/Checkout/presentation/view/widgets/delivery_address_section.dart';
import 'package:flower_app/features/Checkout/presentation/view/widgets/delivery_time_section.dart';
import 'package:flower_app/features/Checkout/presentation/view/widgets/gift_section.dart';
import 'package:flower_app/features/Checkout/presentation/view/widgets/payment_section.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        titleSpacing: 0,
        title: Text(
          S.of(context).checkout,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //--------------> Delivery Time Section <-------------//
            DeliveryTimeSection(),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xffEAEAEA),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //--------------> Delivery Address Section <-------------//
            DeliveryAddressSection(),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xffEAEAEA),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //--------------> Payment Section <-------------//
            PaymentMethodSection(),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xffEAEAEA),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //--------------> Gift Section <-------------//
            GiftInfoSection(),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xffEAEAEA),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CheckoutSummary(
              total: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: customButton(
                title: S.of(context).placeOrder,
                onTap: () {},
                color: AppColors.primaryColor,
                textColor: Colors.white,
              ),
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
