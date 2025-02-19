import 'package:ai_weather/core/api/services.dart';
import 'package:ai_weather/core/injectable/injectable.dart';
import 'package:ai_weather/features/home/presentation/manager/forecast_cubit/forecast_cubit.dart';
import 'package:ai_weather/features/home/presentation/widgets/forecast_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForecastPage extends StatelessWidget {
  ForecastPage({super.key});

  var bloc = getIt<ForecastCubit>();
  var location = LocationService();

  @override
  Widget build(BuildContext context) {
    location.getLocation().then(
      (value) {
        if (value != null) {
          bloc.getForecast('${value.latitude},${value.longitude}');
        }
      },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff000080),
                Color(0xff1D3C6A),
                Color(0xff5C4D7D),
                Color(0xff3A6EA5),
                Color(0xff00008B),
              ])),
          child: BlocBuilder<ForecastCubit, ForecastState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is ForecastLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ForecastFailureState) {
                return Center(
                  child: Text(state.failures.ErrorMessage),
                );
              } else if (state is ForecastSuccessState) {
                return ForecastScreenBody(
                  response: state.responseEntity,
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
