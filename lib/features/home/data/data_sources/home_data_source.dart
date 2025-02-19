import 'package:ai_weather/core/api/api_manger.dart';
import 'package:ai_weather/core/failure.dart';
import 'package:ai_weather/features/home/data/models/ResponseModel.dart';
import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class HomeDataSource {
  Future<Either<Failures, ResponseEntity>> getWeather({String? city});
}
@Injectable(as: HomeDataSource)
class HomeRemoteDataSource implements HomeDataSource {
  ApiManger apiManger;

  HomeRemoteDataSource(this.apiManger);

  @override
  Future<Either<Failures, ResponseEntity>> getWeather({String? city}) async {
    try {
      var response = await apiManger.getWeather(city: city);
      var HomeResponse = ResponseModel.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(HomeResponse);
      } else {
        return Left(
          ServerError(ErrorMessage: response.statusMessage!),
        );
      }
    } catch (e) {
      return Left(
        ServerError(
          ErrorMessage: e.toString(),
        ),
      );
    }
  }
}
