import 'package:get_it/get_it.dart';

import '../product_trager/product_trager_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register your ProductTragerCubit instance as a singleton
  getIt.registerSingleton<ProductTragerCubit>(ProductTragerCubit());
}
