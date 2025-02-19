import 'package:ai_weather/core/api/api_manger.dart';
import 'package:ai_weather/features/home/data/models/ResponseModel.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failure.dart';
import '../../domain/entities/ResponseEntity.dart';

abstract class ForecastDataSource {
  Future<Either<Failures, ResponseEntity>> getForecast(String city);
}

@Injectable(as: ForecastDataSource)
class ForecastRemoteDataSource implements ForecastDataSource {
  ApiManger apiManger;

  ForecastRemoteDataSource({required this.apiManger});

  @override
  Future<Either<Failures, ResponseEntity>> getForecast(String city) async {
    try {
      var response = await apiManger.getForecast(city);
      var ForecastResponse = ResponseModel.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(ForecastResponse);
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
