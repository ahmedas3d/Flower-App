import 'dart:ui';

import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({
    super.key,
    required this.imageAsset,
    required this.title,
  });

  final String imageAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64,
          width: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.pinkLight,
          ),
          child: Center(
            child: Image.asset(
              imageAsset,
              width: 24,
              height: 23,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textColor1,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'image': 'assets/icons/tulip.png',
        'title': S.of(context).flowers,
      },
      {
        'image': 'assets/icons/gift.png',
        'title': S.of(context).gifts,
      },
      {
        'image': 'assets/icons/card.png',
        'title': S.of(context).cards,
      },
      {
        'image': 'assets/icons/diamond.png',
        'title': S.of(context).jewellery,
      },
      {
        'image': 'assets/icons/tulip.png',
        'title': S.of(context).flowers,
      },
    ];
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: CustomCategories(
              imageAsset: items[index]['image']!,
              title: items[index]['title']!,
            ),
          );
        },
      ),
    );
  }
}
