import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/Home/view/widgets/best_seller.dart';
import 'package:flower_app/features/Home/view/widgets/custom_categories.dart';
import 'package:flower_app/features/Home/view/widgets/custom_discover_card.dart';
import 'package:flower_app/features/Home/view/widgets/custom_search_field.dart';
import 'package:flower_app/features/Home/view/widgets/custom_titel.dart';
import 'package:flower_app/features/Home/view/widgets/occasion.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 40, left: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/flower.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Flowery',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'IM FELL English',
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: customSearchField(),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: AppColors.greyColor,
                  ),
                  Text(
                    'Deliver to ',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      color: AppColors.greyColor,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '2XVP+XC - Sheikh Zayed ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: AppColors.textColor1,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 24,
                        color: AppColors.primaryColor,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              customTitle(
                title: 'Discover something now',
              ),
              SizedBox(
                height: 10,
              ),
              DiscoverList(),
              SizedBox(height: 8),
              customTitle(
                title: 'Categories',
                onTap: () {},
                viewAll: 'View All',
              ),
              SizedBox(
                height: 10,
              ),
              CategoriesList(),
              SizedBox(
                height: 10,
              ),
              customTitle(
                title: 'Best Sellers',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.bestSellerScreen);
                },
                viewAll: 'View All',
              ),
              SizedBox(
                height: 10,
              ),
              BestSellerList(),
              SizedBox(
                height: 10,
              ),
              customTitle(
                title: 'Occasion',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.occasionScreen);
                },
                viewAll: 'View All',
              ),
              SizedBox(
                height: 10,
              ),
              OccasionList(),
            ],
          ),
        ),
      ),
    );
  }
}
