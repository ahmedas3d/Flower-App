import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_text_field.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  AddAddress({super.key});

  final TextEditingController address = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController recipientName = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController area = TextEditingController();
  final GlobalKey<FormState> _formaddressKey = GlobalKey<FormState>();
  final List<String> cities = ['Cairo', 'Alexandria', 'Giza', 'Luxor'];
  final List<String> areas = ['Downtown', 'Zamalek', 'Maadi', 'Nasr City'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(S.of(context).address),
        backgroundColor: AppColors.backgroundColor,
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Map Placeholder',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formaddressKey,
                child: Column(
                  children: [
                    customTextField(
                      controller: address,
                      label: S.of(context).address,
                      hint: "Enter your address",
                    ),
                    const SizedBox(height: 15),
                    customTextField(
                      controller: phoneNumber,
                      label: S.of(context).phoneNumber,
                      hint: S.of(context).enteryourPhoneNumber,
                    ),
                    const SizedBox(height: 15),
                    customTextField(
                      controller: recipientName,
                      label: "Recipient Name",
                      hint: "Enter your recipient name",
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            dropdownColor: AppColors.backgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                              labelText: 'City',
                              labelStyle: const TextStyle(
                                color: AppColors.textColor3,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: AppColors.textColor3,
                                ),
                              ),
                            ),
                            items: cities.map((String city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              );
                            }).toList(),
                            onChanged: (value) {
                              print('Selected City: $value');
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            dropdownColor: AppColors.backgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            decoration: InputDecoration(
                              labelText: 'Area',
                              labelStyle: const TextStyle(
                                color: AppColors.textColor3,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: AppColors.textColor3,
                                ),
                              ),
                            ),
                            items: areas.map((String area) {
                              return DropdownMenuItem<String>(
                                value: area,
                                child: Text(area),
                              );
                            }).toList(),
                            onChanged: (value) {
                              print('Selected Area: $value');
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    customButton(
                      title: S.of(context).sacedAddresses,
                      onTap: () {},
                      color: AppColors.primaryColor,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
