part of 'categorics_cubit.dart';

@immutable
abstract class FlowerCategoriesState {}

class CategoricsInitial extends FlowerCategoriesState {}

class CategoricsLoading extends FlowerCategoriesState {}

class CategoricsLoaded extends FlowerCategoriesState {
  final List<FlowerCategory> categorics;
  CategoricsLoaded({required this.categorics});
}

class CategoricsError extends FlowerCategoriesState {
  final String message;
  CategoricsError(this.message);
}
