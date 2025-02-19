import 'package:ai_weather/features/home/domain/use_cases/home_use_case.dart';
import 'package:ai_weather/features/home/presentation/manager/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeUseCase homeUseCase;

  HomeCubit({required this.homeUseCase}) : super(HomeInitialState());

  getWeather({String? city}) async {
    emit(HomeLoadingState());
    var data = await homeUseCase.call(city: city);
    data.fold(
      (error) => emit(
        HomeFailureState(failures: error),
      ),
      (response) => emit(
        HomeSuccessState(responseEntity: response),
      ),
    );
  }
}
