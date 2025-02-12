import 'package:bloc/bloc.dart';
import 'package:flower_app/features/Categories/data/service/get_all_categores.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../data/model/categorie.dart';

part 'categorics_state.dart';

class CategoricsCubit extends Cubit<CategoricsState> {
  CategoricsCubit() : super(CategoricsInitial());
  final GetAllCategores getAllCategores = GetAllCategores();
  Future<void> getAllCategories() async {
    emit(CategoricsLoading());
    final response = await getAllCategores.getAllCategores();
    if (response.statusCode == 200) {
      final List<FlowerCategory> categorics =
          (response.data['categories'] as List)
              .map((e) => FlowerCategory.fromJson(e as Map<String, dynamic>))
              .toList();
      for (var i in categorics) {
        print(i);
      }
      emit(CategoricsLoaded(categorics: categorics));
    } else {
      emit(CategoricsError(response.statusCode.toString()));
    }
  }
}
