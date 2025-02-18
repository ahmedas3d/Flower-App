import 'package:flower_app/core/constants.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AllOccasion extends StatelessWidget {
  const AllOccasion({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.price,
    required this.sale,
    required this.discount,
  });

  final String imageAsset;
  final String title;
  final String price;
  final String sale;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productDetails);
      },
      child: Container(
        height: 234,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 135,
                width: 180,
                decoration: const BoxDecoration(
                  color: AppColors.pinkLight,
                ),
                child: Center(
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 40,
                width: 125,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textColor1,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'EGP $price',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textColor1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          discount,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.greyColor,
                            decorationThickness: 2.0,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          sale,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.greenColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      S.of(context).addToCart,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
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

class OccasionListScreen extends StatelessWidget {
  OccasionListScreen({super.key});

  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Red roses',
      'price': '600',
      'sale': '20%',
      'discount': '800',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Sunny Vase',
      'price': '450',
      'sale': '15%',
      'discount': '530',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Spring Flowers',
      'price': '700',
      'sale': '10%',
      'discount': '780',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Red roses',
      'price': '600',
      'sale': '20%',
      'discount': '800',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Sunny Vase',
      'price': '450',
      'sale': '15%',
      'discount': '530',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Spring Flowers',
      'price': '700',
      'sale': '10%',
      'discount': '780',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Red roses',
      'price': '600',
      'sale': '20%',
      'discount': '800',
    },
    {
      'image': 'assets/images/best-seller4.png',
      'title': 'Sunny Vase',
      'price': '450',
      'sale': '15%',
      'discount': '530',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AllOccasion(
          imageAsset: items[index]['image']!,
          title: items[index]['title']!,
          price: items[index]['price']!,
          sale: items[index]['sale']!,
          discount: items[index]['discount']!,
        );
      },
    );
  }
}
