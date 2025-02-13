import 'package:flower_app/core/constants.dart';
import 'package:flutter/material.dart';

import '../../../../Home/data/models/product/get_all_product_model.dart';

class ProductInCart extends StatefulWidget {
  final Function(int) onTotalChanged;
  final Function(int) onItemsCountChanged;
  final List<ProductModel> products;
  final int deliveryFee;

  const ProductInCart({
    super.key,
    required this.onTotalChanged,
    required this.onItemsCountChanged,
    required this.products,
    required this.deliveryFee,
  });

  @override
  State<ProductInCart> createState() => _ProductInCartState();
}

class _ProductInCartState extends State<ProductInCart> {
  @override
  void initState() {
    super.initState();
    for (var product in widget.products) {
      product.quantity = 1;
    }
  }

  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      widget.products[index].quantity = newQuantity > 0 ? newQuantity : 1;
      widget.onTotalChanged(total);
      widget.onItemsCountChanged(itemsCount);
    });
  }

  void _removeProduct(int index) {
    setState(() {
      widget.products.removeAt(index);
      widget.onTotalChanged(total);
      widget.onItemsCountChanged(itemsCount);
    });
  }

  int get total {
    int subtotal = widget.products.fold(
      0,
      (sum, product) => sum + (product.price * product.quantity),
    );
    return subtotal + widget.deliveryFee;
  }

  int get itemsCount {
    return widget.products.fold(0, (sum, product) => sum + product.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ProductItem(
              image: product.imageCover,
              name: product.title,
              price: product.price,
              description: product.description.substring(0, 6),
              quantity: product.quantity,
              onQuantityChanged: (newQuantity) {
                _updateQuantity(index, newQuantity);
              },
              onRemove: () {
                _removeProduct(index);
              },
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
  final VoidCallback onRemove;

  const ProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.greyColor),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 90,
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
                    Expanded(
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.textColor1,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: AppColors.errorColor,
                        size: 20,
                      ),
                      onPressed: onRemove,
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
                      "EGP ${price.toString()}",
                      style: const TextStyle(
                        fontSize: 16,
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
                          style: const TextStyle(
                            fontSize: 16,
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
