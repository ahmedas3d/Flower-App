import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class PaymentMethodSection extends StatefulWidget {
  const PaymentMethodSection({super.key});

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

// Enum for payment methods
enum PaymentMethod {
  cashOnDelivery,
  creditCard,
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  PaymentMethod? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).paymentMethod,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.textColor3),
            ),
            child: Column(
              children: [
                RadioListTile<PaymentMethod>(
                  title: Text(S.of(context).cashOnDelivery),
                  subtitle: Text(S.of(context).cashOnDeliveryDescription),
                  value: PaymentMethod.cashOnDelivery,
                  groupValue: _selectedMethod,
                  onChanged: (PaymentMethod? value) {
                    setState(() {
                      _selectedMethod = value;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                const Divider(height: 1, indent: 20, endIndent: 20),
                RadioListTile<PaymentMethod>(
                  title: Text(S.of(context).creditCard),
                  subtitle: Text(S.of(context).creditCardDescription),
                  value: PaymentMethod.creditCard,
                  groupValue: _selectedMethod,
                  onChanged: (PaymentMethod? value) {
                    setState(() {
                      _selectedMethod = value;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
