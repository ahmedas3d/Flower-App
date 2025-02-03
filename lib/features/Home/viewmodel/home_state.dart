part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ProductModel> products;

  HomeLoaded({required this.products});
}

class HomeError extends HomeState {
  final String error;

  HomeError({required this.error});
}
