import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:ai_weather/features/home/domain/repositories/prediction_repo.dart';

class PredictionUseCase {
  final PredictionRepo predictionRepo;

  PredictionUseCase(this.predictionRepo);

  Future<List<dynamic>> call(ResponseEntity weatherData) async =>
      await predictionRepo.getPrediction(weatherData);
}
