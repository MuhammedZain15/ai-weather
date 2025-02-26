import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:ai_weather/features/home/domain/use_cases/prediction_use_case.dart';
import 'package:bloc/bloc.dart';

part 'prediction_state.dart';

class PredictionCubit extends Cubit<PredictionState> {
  final PredictionUseCase predictionUseCase;

  PredictionCubit(this.predictionUseCase) : super(PredictionInitialState());

  Future<void> getPrediction(ResponseEntity weatherData) async {
    emit(PredictionLoadingState());
    try {
      final prediction = await predictionUseCase.call(weatherData);
      emit(PredictionSuccessState(prediction: prediction));
    } catch (e) {
      emit(PredictionFailureState(errorMessage: e.toString()));
    }
  }
}
