import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flower_app/features/Home/data/models/occasions/occasions.dart';

class GetAllOccasion {
  final Dio dio = Dio();

  Future<Either<String, List<OccasionsModel>>> getAllOccasion() async {
    //here i using the either to handle the error
    try {
      final response =
          await dio.get('https://flower.elevateegy.com/api/v1/occasions');
      List<OccasionsModel> occasions = [];
      for (var item in response.data['occasions']) {
        occasions.add(OccasionsModel.fromJson(item));
      }

      return Right(occasions);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
