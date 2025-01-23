import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/features/Home/view/widgets/best_seller.dart';
import 'package:flower_app/features/Home/view/widgets/custom_categories.dart';
import 'package:flower_app/features/Home/view/widgets/custom_discover_card.dart';
import 'package:flower_app/features/Home/view/widgets/custom_row_address.dart';
import 'package:flower_app/features/Home/view/widgets/custom_search_field.dart';
import 'package:flower_app/features/Home/view/widgets/custom_titel.dart';
import 'package:flower_app/features/Home/view/widgets/occasion.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    SvgPicture.asset(
                      'assets/icons/Flower.svg',
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
              CustomRowAddress(),
              SizedBox(height: 8),
              customTitle(
                title: S.of(context).descoverSomethingNow,
              ),
              SizedBox(
                height: 10,
              ),
              DiscoverList(),
              SizedBox(height: 8),
              customTitle(
                title: S.of(context).categories,
                onTap: () {},
                viewAll: S.of(context).viewAll,
              ),
              SizedBox(
                height: 10,
              ),
              CategoriesList(),
              SizedBox(
                height: 10,
              ),
              customTitle(
                title: S.of(context).bestSellers,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.bestSellerScreen);
                },
                viewAll: S.of(context).viewAll,
              ),
              SizedBox(
                height: 10,
              ),
              BestSellerList(),
              SizedBox(
                height: 10,
              ),
              customTitle(
                title: S.of(context).occasion,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.occasionScreen);
                },
                viewAll: S.of(context).viewAll,
              ),
              SizedBox(
                height: 10,
              ),
              OccasionList(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
