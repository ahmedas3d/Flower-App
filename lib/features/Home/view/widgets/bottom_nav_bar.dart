import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/Cart/presentation/view/screens/cart_screen.dart';
import 'package:flower_app/features/Cart/presentation/view/screens/no_product_in_cart.dart';
import 'package:flower_app/features/Categories/view/screens/categories_screen.dart';
import 'package:flower_app/features/Home/view/screens/home_screen.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/profile_screen.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.backgroundColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 11,
        unselectedItemColor: AppColors.greyColor,
        selectedItemColor: AppColors.primaryColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: S.of(context).categories,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: S.of(context).cart,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: S.of(context).profile,
          ),
        ],
      ),
    );
  }
}
