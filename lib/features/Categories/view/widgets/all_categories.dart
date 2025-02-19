import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider_base_tools/provider_base_tools.dart';

import '../../viewmodel/products_cubit.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  int selectedIndex = 0;

  final List<Map<String, String>> categories = [
    {'All': 'All'},
    {'gits': '673c472f1159920171827c8a'},
    {'Flowers': '673c46fd1159920171827c85'},
    {'cards': '673c47441159920171827c8d'},
    {'Jewellery': '673c47591159920171827c90'},
    {'perfumes': '673c47751159920171827c93'},
    {'watches': '673c47881159920171827c96'},
    {'chocolate': '673c479e1159920171827c99'},
    {'Cakes': '673c4a551159920171827c9e'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isActive = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                context.read<ProductsCubit>().selectedCategory =
                    categories[index].values.first;

                context.read<ProductsCubit>().getAllProducts();

                //chnage the list of products based on the selected id-> category
              });

              print(context.read<ProductsCubit>().selectedCategory);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    categories[index].keys.first,
                    style: TextStyle(
                      fontSize: 16,
                      color: isActive ? AppColors.primaryColor : Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 40,
                  color: isActive ? AppColors.primaryColor : Colors.grey[300],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
