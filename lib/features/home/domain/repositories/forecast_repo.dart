import 'package:ai_weather/core/failure.dart';
import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:dartz/dartz.dart';

abstract class ForecastRepo {
  Future<Either<Failures, ResponseEntity>> getForecast(String city);
}
