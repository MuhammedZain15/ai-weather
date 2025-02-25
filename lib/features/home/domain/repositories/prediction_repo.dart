import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';

abstract class PredictionRepo {
  Future<List<dynamic>> getPrediction(ResponseEntity weatherData);
}
