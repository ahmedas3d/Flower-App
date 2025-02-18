import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/core/constants.dart';

class GiftInfoSection extends StatefulWidget {
  const GiftInfoSection({super.key});

  @override
  State<GiftInfoSection> createState() => _GiftInfoSectionState();
}

class _GiftInfoSectionState extends State<GiftInfoSection> {
  bool _isGift = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: Text(
              S.of(context).itIsAGift,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.textColor1,
                fontWeight: FontWeight.bold,
              ),
            ),
            value: _isGift,
            onChanged: (bool value) {
              setState(() {
                _isGift = value;
              });
            },
            activeColor: AppColors.primaryColor,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: _isGift,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.textColor3),
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: S.of(context).name,
                      hintText: S.of(context).enterYourName,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: AppColors.textColor3),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textColor1,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: S.of(context).phoneNumber,
                      hintText: S.of(context).enteryourPhoneNumber,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: AppColors.textColor3),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textColor1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
