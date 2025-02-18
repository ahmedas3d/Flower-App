import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/TrackOrder/presentation/view/screens/out_for_delivery.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class TrackOrders extends StatelessWidget {
  const TrackOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        titleSpacing: 0,
        title: Text(
          S.of(context).trackOrder,
          style: const TextStyle(
            color: AppColors.textColor1,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: OutForDelivery(),
    );
  }
}
