import 'package:firebase_core/firebase_core.dart';
import 'package:flower_app/blocobserve.dart';
import 'package:flower_app/core/routes/routes.dart';
import 'package:flower_app/core/utils/product_trager/product_trager_cubit.dart';
import 'package:flower_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/utils/service/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  setupServiceLocator();
  Bloc.observer = myblocobsever();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlocProvider<ProductTragerCubit>(
    create: (context) => ProductTragerCubit(),
    child: const FlowerApp(),
  ));
}

class FlowerApp extends StatefulWidget {
  const FlowerApp({super.key});

  @override
  State<FlowerApp> createState() => _FlowerAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _FlowerAppState? state = context.findAncestorStateOfType<_FlowerAppState>();
    state?.setLocale(newLocale);
  }
}

class _FlowerAppState extends State<FlowerApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
      theme: ThemeData(
        fontFamily: 'Almarai',
      ),
      locale: _locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
