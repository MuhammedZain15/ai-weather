import 'package:ai_weather/core/failure.dart';
import 'package:ai_weather/features/home/data/data_sources/forecast_data_source.dart';
import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:ai_weather/features/home/domain/repositories/forecast_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForecastRepo)
class ForecastRepoImpl implements ForecastRepo {
  ForecastDataSource forecastDataSource;

  ForecastRepoImpl(this.forecastDataSource);

  @override
  Future<Either<Failures, ResponseEntity>> getForecast(String city) async {
    var data = await forecastDataSource.getForecast(city);
    return data.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }
}
