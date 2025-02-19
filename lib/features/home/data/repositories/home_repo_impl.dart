import 'package:ai_weather/core/failure.dart';
import 'package:ai_weather/features/home/data/data_sources/home_data_source.dart';
import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:ai_weather/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDataSource homeDataSource;

  HomeRepoImpl(this.homeDataSource);

  @override
  Future<Either<Failures, ResponseEntity>> getWeather({String? city}) async {
    var data = await homeDataSource.getWeather(city: city);
    return data.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }
}
