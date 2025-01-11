import 'dart:ui';

import 'package:flower_app/core/constants.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class Occasion extends StatelessWidget {
  const Occasion({
    super.key,
    required this.imageAsset,
    required this.title,
  });

  final String imageAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 131,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textColor1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class OccasionList extends StatelessWidget {
  OccasionList({super.key});

  List<Map<String, String>> items(BuildContext context) => [
        {
          'image': 'assets/images/occasion1.jpg',
          'title': S.of(context).wedding,
        },
        {
          'image': 'assets/images/occasion.jpg',
          'title': S.of(context).birthday,
        },
        {
          'image': 'assets/images/occasion2.jpg',
          'title': S.of(context).graduation,
        },
      ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items(context).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: Occasion(
              imageAsset: items(context)[index]['image']!,
              title: items(context)[index]['title']!,
            ),
          );
        },
      ),
    );
  }
}
