import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/core/constants.dart';

class CheckoutSummary extends StatelessWidget {
  final int total; // الـ Total يتم تمريره من الخارج

  const CheckoutSummary({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600; // تحديد الشاشات الصغيرة

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isSmallScreen ? 0 : 10),
          topRight: Radius.circular(isSmallScreen ? 0 : 10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
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
          // Checkout Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // إجراءات الدفع
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                S.of(context).checkout,
                style: TextStyle(
                  fontSize: isSmallScreen ? 14 : 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ),
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
