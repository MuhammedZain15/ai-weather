import 'package:ai_weather/core/components/custom_dialog.dart';
import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:ai_weather/features/home/presentation/manager/prediction_cubit/prediction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PredictionWidget extends StatelessWidget {
  final ResponseEntity weatherData;

  const PredictionWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PredictionCubit, PredictionState>(
      listener: (context, state) {
        if (state is PredictionSuccessState) {
          showDialog(
            context: context,
            builder: (context) => CustomDialog(
              color: state.prediction == 1 ? Colors.green : Colors.red,
              text: state.prediction == 1
                  ? "It's a great time to go outside! ☀️"
                  : "Better to stay inside today. 🌧️",
              isGood: state.prediction == 1 ? true : false,
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            onPressed: () {
              context.read<PredictionCubit>().getPrediction(weatherData);
              print(state);
            },
            child: state is PredictionLoadingState
                ? CircularProgressIndicator()
                : Text(
                    "Ai-Prediction",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
          ),
        );
      },
    );
  }
}
