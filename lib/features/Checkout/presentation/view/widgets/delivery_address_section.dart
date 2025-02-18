import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/social_button.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class Address {
  final int id;
  final String title;
  final String address;

  Address({
    required this.id,
    required this.title,
    required this.address,
  });
}

class DeliveryAddressSection extends StatefulWidget {
  const DeliveryAddressSection({super.key});

  @override
  State<DeliveryAddressSection> createState() => _DeliveryAddressSectionState();
}

class _DeliveryAddressSectionState extends State<DeliveryAddressSection> {
  int? selectedAddressId;
  List<Address> addresses = [
    Address(
      id: 1,
      title: 'Home',
      address: '2XVP+XC - Sheikh Zayed',
    ),
    Address(
      id: 2,
      title: 'Office',
      address: '5ABC+XY - Downtown Dubai',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).deliveryAddress,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: addresses.length,
            itemBuilder: (context, index) {
              final address = addresses[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.textColor3,
                    ),
                  ),
                  child: RadioListTile<int>(
                    value: address.id,
                    groupValue: selectedAddressId,
                    onChanged: (value) {
                      setState(() {
                        selectedAddressId = value;
                      });
                    },
                    activeColor: AppColors.primaryColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.textColor1,
                              size: 20,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              address.title,
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.textColor1,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.grey,
                                size: 24,
                              ),
                              onPressed: () {
                                // Handle edit button press
                              },
                            ),
                          ],
                        ),
                        Text(
                          address.address,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          socialButton(
            title: S.of(context).addNewAddress,
            onTap: () {},
            color: AppColors.backgroundColor,
            textColor: AppColors.primaryColor,
            icon: Icons.add,
            borderColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
