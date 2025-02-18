import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SavedAddress extends StatelessWidget {
  const SavedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    const addressCount = 2;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(S.of(context).sacedAddresses),
        backgroundColor: AppColors.backgroundColor,
        titleSpacing: 0,
      ),
      body: ListView.builder(
        itemCount: addressCount + 1,
        itemBuilder: (context, index) {
          if (index < addressCount) {
            return const AddressContainer();
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: customButton(
                title: S.of(context).addNewAddress,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.addAddress);
                },
                color: AppColors.primaryColor,
                textColor: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.textColor3,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.textColor1,
                          size: 20,
                        ),
                        Text(
                          S.of(context).home,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.textColor1,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 22,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '2XVP+XC - Sheikh Zayed',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
