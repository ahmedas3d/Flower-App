import 'package:bloc/bloc.dart';
import 'package:flower_app/features/Categories/data/service/get_all_categores.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../data/model/categorie.dart';

part 'categorics_state.dart';

class FlowerCategoriesCubit extends Cubit<FlowerCategoriesState> {
  FlowerCategoriesCubit() : super(CategoricsInitial());
  final GetAllCategores getAllCategores = GetAllCategores();
  List<FlowerCategory> res_categorics = [];
  Future<void> getAllCategories() async {
    emit(CategoricsLoading());
    final response = await getAllCategores.getAllCategores();
    if (response.statusCode == 200) {
      for (var i in response.data['categories']) {
        print(i);
        FlowerCategory flowerCategory = FlowerCategory.fromJson(i);
        res_categorics.add(flowerCategory);
      }
      emit(CategoricsLoaded(categorics: res_categorics));
    } else {
      emit(CategoricsError(response.statusCode.toString()));
    }
  }
}
