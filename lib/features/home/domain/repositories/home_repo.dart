import 'package:ai_weather/core/failure.dart';
import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
Future<Either<Failures,ResponseEntity>> getWeather({String? city});
}