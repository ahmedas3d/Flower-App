part of 'categorics_cubit.dart';

@immutable
abstract class CategoricsState {}

class CategoricsInitial extends CategoricsState {}

class CategoricsLoading extends CategoricsState {}

class CategoricsLoaded extends CategoricsState {
  final List<FlowerCategory> categorics;
  CategoricsLoaded({required this.categorics});
}

class CategoricsError extends CategoricsState {
  final String message;
  CategoricsError(this.message);
}
