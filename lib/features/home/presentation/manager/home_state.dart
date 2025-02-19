import 'package:ai_weather/core/failure.dart';
import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  ResponseEntity responseEntity;

  HomeSuccessState({required  this.responseEntity});
}

class HomeFailureState extends HomeState {
  Failures failures;

  HomeFailureState({required this.failures});
}
