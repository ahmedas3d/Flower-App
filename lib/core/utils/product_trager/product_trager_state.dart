part of 'product_trager_cubit.dart';

@immutable
abstract class ProductTragerState {}

class ProductTragerInitial extends ProductTragerState {}

class ProductTragerLoading extends ProductTragerState {}

class ProductTragerSuccess extends ProductTragerState {}

class ProductTragerError extends ProductTragerState {
  final String message;

  ProductTragerError({
    required this.message,
  });
}
