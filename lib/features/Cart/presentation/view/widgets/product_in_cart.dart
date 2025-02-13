import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';

import '../../../../Home/data/models/product/get_all_product_model.dart';

class ProductInCart extends StatefulWidget {
  final Function(int) onTotalChanged; // دالة لتحديث الـ Total
  final Function(int) onItemsCountChanged; // دالة لتحديث عدد العناصر
  final List<ProductModel> products;
  const ProductInCart({
    super.key,
    required this.onTotalChanged,
    required this.onItemsCountChanged,
    required this.products,
  });
  @override
  State<ProductInCart> createState() => _ProductInCartState();
}

class _ProductInCartState extends State<ProductInCart> {
  // قائمة بيانات الطلبات
  // final List<Map<String, dynamic>> orders = [
  //   {
  //     "name": "Bouquet of Roses",
  //     "price": 1500, // السعر كرقم لتسهيل العمليات الحسابية
  //     "description": "15 Pink Rose Bouquet",
  //     "quantity": 1, // الكمية الافتراضية
  //   },
  //   {
  //     "name": "Lily Bouquet",
  //     "price": 2000, // السعر كرقم لتسهيل العمليات الحسابية
  //     "description": "15 Pink Rose Bouquet",
  //     "quantity": 1, // الكمية الافتراضية
  //   },
  // ];

  // دالة لتحديث الكمية
  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      // products[index]["quantity"] = newQuantity;
      widget.onTotalChanged(total); // تحديث الـ Total عند تغيير الكمية
      widget.onItemsCountChanged(itemsCount); // تحديث عدد العناصر
    });
  }

  // حساب الـ Total
  int get total {
    return 1;
    //orders.fold(
    // 0, (sum, order) => sum + (order["price"] * order["quantity"] as int));
  }

  // حساب عدد العناصر
  int get itemsCount {
    return 1;
    // return orders.fold(0, (sum, order) => sum + order["quantity"] as int);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600; // تحديد الشاشات الصغيرة

    return Expanded(
      child: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final order = widget.products[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ProductItem(
              image: order.imageCover,
              name: order.title,
              price: order.price,
              description: order.description.substring(0, 6),
              quantity: order.quantity,
              onQuantityChanged: (newQuantity) {
                _updateQuantity(index, newQuantity);
              },
              isSmallScreen: isSmallScreen, // تمرير حالة الشاشة
            ),
          );
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String image;
  final int price;
  final String description;
  final int quantity;
  final Function(int) onQuantityChanged;
  final bool isSmallScreen;

  const ProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
    required this.onQuantityChanged,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmallScreen ? 125 : 150,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.greyColor),
      ),
      child: Row(
        children: [
          Container(
            height: isSmallScreen ? 95 : 120,
            width: isSmallScreen ? 95 : 120,
            decoration: BoxDecoration(
              color: AppColors.pinkLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textColor1,
                      ),
                    ),
                    const Icon(
                      Icons.delete,
                      color: AppColors.errorColor,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textColor3,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "EGP ${(price * quantity).toString()}",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 18,
                        color: AppColors.textColor1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, size: 20),
                          onPressed: () {
                            if (quantity > 1) {
                              onQuantityChanged(quantity - 1);
                            }
                          },
                        ),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: isSmallScreen ? 14 : 16,
                            color: AppColors.textColor1,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, size: 20),
                          onPressed: () {
                            onQuantityChanged(quantity + 1);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
