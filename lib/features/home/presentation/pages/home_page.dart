import 'package:ai_weather/core/api/services.dart';
import 'package:ai_weather/core/injectable/injectable.dart';
import 'package:ai_weather/features/home/presentation/manager/home_cubit.dart';
import 'package:ai_weather/features/home/presentation/manager/home_state.dart';
import 'package:ai_weather/features/home/presentation/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var bloc = getIt<HomeCubit>();
  var location = LocationService();

  @override
  Widget build(BuildContext context) {
    location.getLocation().then(
      (value) {
        if (value != null) {
          bloc.getWeather(city: '${value.latitude},${value.longitude}');
        }
      },
    );
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: Color(0xff000421),
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
                ]),
          ),
          child: BlocBuilder<HomeCubit, HomeState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeFailureState) {
                return Center(
                  child: Text(state.failures.ErrorMessage),
                );
              } else if (state is HomeSuccessState) {
                return HomeScreenBody(
                  responseEntity: state.responseEntity,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
