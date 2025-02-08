import 'package:bloc/bloc.dart';
import 'package:flower_app/features/Home/data/models/occasions/occasions.dart';
import 'package:meta/meta.dart';

import '../../data/services/occasion/get_all_occasion.dart';

part 'occasions_state.dart';

class OccasionsCubit extends Cubit<OccasionsState> {
  OccasionsCubit() : super(OccasionsInitial());
  final GetAllOccasion getAllOccasion = GetAllOccasion();

  Future<void> getAllOccasions() async {
    emit(OccasionsLoading());
    final occasions = await getAllOccasion.getAllOccasion();
    if (occasions.isLeft) {
      emit(OccasionsError(error: occasions.left));
    } else {
      emit(OccasionsLoaded(occasions: occasions.right));
    }
  }
}
