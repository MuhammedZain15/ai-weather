import 'package:ai_weather/core/api/api_manger.dart';
import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:ai_weather/features/home/domain/repositories/prediction_repo.dart';

class PredictionRepoImpl implements PredictionRepo {
  final ApiManger apiManger;

  PredictionRepoImpl(this.apiManger);

  @override
  Future<List> getPrediction(ResponseEntity weatherData) {
    var data = apiManger.getPredictionFromWeatherData(weatherData);
    return data;
  }
}
