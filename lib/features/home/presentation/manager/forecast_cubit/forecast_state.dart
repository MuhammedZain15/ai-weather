part of 'forecast_cubit.dart';

abstract class ForecastState {}

final class ForecastInitialState extends ForecastState {}

final class ForecastLoadingState extends ForecastState {}

final class ForecastSuccessState extends ForecastState {
  ResponseEntity responseEntity;

  ForecastSuccessState({required this.responseEntity});
}

final class ForecastFailureState extends ForecastState {
  Failures failures;

  ForecastFailureState({required this.failures});
}
