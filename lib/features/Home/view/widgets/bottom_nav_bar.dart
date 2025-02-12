import 'package:flower_app/core/constants.dart';
import 'package:flower_app/features/AuthFeature/presentation/viewmodel/auth_cubit.dart';
import 'package:flower_app/features/Cart/presentation/view/screens/cart_screen.dart';
import 'package:flower_app/features/Categories/view/screens/categories_screen.dart';
import 'package:flower_app/features/Categories/viewmodel/categorics/categorics_cubit.dart';
import 'package:flower_app/features/Home/view/screens/home_screen.dart';
import 'package:flower_app/features/Home/viewmodel/homecubit/home_cubit.dart';
import 'package:flower_app/features/Profile/presentation/view/screens/profile_screen.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewmodel/occasioncubit/occasions_cubit.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<OccasionsCubit>(
          create: (context) => OccasionsCubit(),
        ),
      ],
      child: const HomeScreen(),
    ),
    BlocProvider<FlowerCategoriesCubit>(
      create: (context) {
        final cubit = FlowerCategoriesCubit();
        cubit.getAllCategories();
        return cubit;
      },
      child: const CategoriesScreen(),
    ),
    const CartScreen(),
    BlocProvider(
      create: (context) => AuthCubit(),
      child: ProfileScreen(),
    ),
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
            icon: const Icon(Icons.home),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: S.of(context).categories,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: S.of(context).cart,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: S.of(context).profile,
          ),
        ],
      ),
    );
  }
}
