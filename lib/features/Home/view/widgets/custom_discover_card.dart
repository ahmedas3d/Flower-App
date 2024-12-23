import 'dart:ui';

import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';

class CustomDiscoverCard extends StatelessWidget {
  const CustomDiscoverCard({
    super.key,
    required this.imageAsset,
    required this.title,
  });

  final String imageAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 215,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              height: 105,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor2,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Gift Now',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DiscoverList extends StatelessWidget {
  DiscoverList({super.key});

  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/grad_card.png',
      'title': 'It\'s time to celebrate all grads with happiness',
    },
    {
      'image': 'assets/images/birthday_card.png',
      'title': 'Discover the perfect\nbirthday gift',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: CustomDiscoverCard(
              imageAsset: items[index]['image']!,
              title: items[index]['title']!,
            ),
          );
        },
      ),
    );
  }
}
