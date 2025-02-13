import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/core/constants.dart';

class CheckoutSummary extends StatelessWidget {
  final int total; // الـ Total يتم تمريره من الخارج

  const CheckoutSummary({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          // Sub Total
          _buildSummaryRow(S.of(context).subTotal, "EGP ${total.toString()}"),
          const SizedBox(height: 10),
          // Delivery Fee
          _buildSummaryRow(S.of(context).deliveryFee, "EGP 10"),
          const SizedBox(height: 10),
          // Divider
          const Divider(color: AppColors.greyColor),
          const SizedBox(height: 10),
          // Total
          _buildSummaryRow(S.of(context).total, "EGP ${total + 10}",
              isTotal: true),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // دالة مساعدة لإنشاء صف تفاصيل الفاتورة
  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            color: isTotal ? AppColors.textColor1 : AppColors.textColor3,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            color: isTotal ? AppColors.textColor1 : AppColors.textColor3,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
