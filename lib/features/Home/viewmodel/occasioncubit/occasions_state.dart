part of 'occasions_cubit.dart';

@immutable
abstract class OccasionsState {}

class OccasionsInitial extends OccasionsState {}

class OccasionsLoading extends OccasionsState {}

class OccasionsLoaded extends OccasionsState {
  final List<OccasionsModel> occasions;

  OccasionsLoaded({required this.occasions});
}

class OccasionsError extends OccasionsState {
  final String error;
  OccasionsError({required this.error});
}
