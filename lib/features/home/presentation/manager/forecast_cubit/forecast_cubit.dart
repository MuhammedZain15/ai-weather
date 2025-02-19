import 'package:ai_weather/core/failure.dart';
import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:ai_weather/features/home/domain/use_cases/forecast_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'forecast_state.dart';
@injectable
class ForecastCubit extends Cubit<ForecastState> {
  ForecastUseCase forecastUseCase;
  List<ForecastdayEntity> forecastList = [];

  ForecastCubit({required this.forecastUseCase})
      : super(ForecastInitialState());

  getForecast(String city) async {
    emit(ForecastLoadingState());
    var data = await forecastUseCase.call(city);
    data.fold(
        (error) => emit(
              ForecastFailureState(failures: error),
            ), (forecastResponse) {
      forecastList = forecastResponse.forecast!.forecastday ?? [];
      emit(ForecastSuccessState(responseEntity: forecastResponse));
    });
  }
}
