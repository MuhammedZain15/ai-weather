part of 'prediction_cubit.dart';

abstract class PredictionState {}

final class PredictionInitialState extends PredictionState {}

final class PredictionLoadingState extends PredictionState {}

final class PredictionSuccessState extends PredictionState {
   var prediction;

  PredictionSuccessState({required this.prediction});
}

final class PredictionFailureState extends PredictionState {
  final String errorMessage;

  PredictionFailureState({required this.errorMessage});
}
