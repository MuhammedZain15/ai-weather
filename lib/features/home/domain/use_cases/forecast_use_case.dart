import 'package:ai_weather/features/home/domain/repositories/forecast_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failure.dart';
import '../entities/ResponseEntity.dart';

@injectable
class ForecastUseCase {
  ForecastRepo forecastRepo;

  ForecastUseCase(this.forecastRepo);

  Future<Either<Failures, ResponseEntity>> call(String city) =>
      forecastRepo.getForecast(city);
}
