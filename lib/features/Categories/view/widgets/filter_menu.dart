import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/view/widgets/custom_button.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class FilterMenu extends StatefulWidget {
  const FilterMenu({super.key});

  @override
  State<FilterMenu> createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {
  RangeValues _currentRangeValues = const RangeValues(0, 1500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          Text(
            S.of(context).sortBy,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontSize: 20,
            ),
          ),
          CustomRowFilter(
            title: S.of(context).lowesPrice,
          ),
          CustomRowFilter(
            title: S.of(context).highesPrice,
          ),
          CustomRowFilter(
            title: S.of(context).newe,
          ),
          CustomRowFilter(
            title: S.of(context).old,
          ),
          CustomRowFilter(
            title: S.of(context).discount,
          ),
          Text(
            S.of(context).price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontSize: 16,
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 8,
              ),
              overlayShape: const RoundSliderOverlayShape(
                overlayRadius: 16,
              ),
            ),
            child: RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 1500,
              divisions: 50,
              activeColor: Colors.pink,
              inactiveColor: Colors.grey.shade300,
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${_currentRangeValues.start.round()}",
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              Text(
                "\$${_currentRangeValues.end.round()}",
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          customButton(
            title: S.of(context).filter,
            onTap: () {
              Navigator.pop(context);
            },
            color: AppColors.primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class CustomRowFilter extends StatefulWidget {
  const CustomRowFilter({super.key, required this.title});

  final String title;

  @override
  _CustomRowFilterState createState() => _CustomRowFilterState();
}

class _CustomRowFilterState extends State<CustomRowFilter> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200] ?? Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Radio(
              groupValue: isChecked,
              activeColor: AppColors.primaryColor,
              value: true,
              onChanged: (bool? newValue) {
                setState(() {
                  isChecked = newValue ?? false;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
