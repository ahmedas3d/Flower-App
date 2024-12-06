import 'package:flower_app/blocobserve.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
>>>>>>> origin/master

void main() {
  Bloc.observer = myblocobsever();
  runApp(
    const FlowerApp(),
  );
}

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: AppRoutes.splash,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.generateRoute,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.linear(1.0)),
              child: widget!,
            );
          },
        );
      },
    );
  }
}
