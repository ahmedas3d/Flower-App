import 'package:flower_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Flower_App());
}

class Flower_App extends StatelessWidget {
  const Flower_App({super.key});

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
