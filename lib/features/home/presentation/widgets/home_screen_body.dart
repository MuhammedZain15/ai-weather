import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:ai_weather/features/home/presentation/manager/user_name_cubit/user_cubit.dart';
import 'package:ai_weather/features/home/presentation/widgets/custom_item.dart';
import 'package:ai_weather/features/home/presentation/widgets/weather_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key, required this.responseEntity});

  final ResponseEntity responseEntity;

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    if (userId != null) {
      context.read<UserCubit>().fetchUserFirstName(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
          ),
          child: BlocBuilder<UserCubit, String?>(
            builder: (context, firstName) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome, $firstName",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.responseEntity.location?.name ?? "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Center(
          child: Column(
            children: [
              WeatherWidget(
                imagePath: widget.responseEntity.current?.condition?.icon ?? "",
                text: widget.responseEntity.current?.condition?.text ?? "",
                textDegree:
                    widget.responseEntity.current?.tempC.toString() ?? "",
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Max: ${widget.responseEntity.forecast?.forecastday?[0].day?.maxtempC}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Min: ${widget.responseEntity.forecast?.forecastday?[0].day?.mintempC}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomItem(
                    icon: Icons.sunny,
                    text: 'Sunrise',
                    textDegree: widget.responseEntity.forecast?.forecastday?[0]
                            .astro?.sunrise ??
                        "",
                    size: 20,
                    iconSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomItem(
                    icon: CupertinoIcons.moon,
                    text: 'Moonrise',
                    textDegree: widget.responseEntity.forecast?.forecastday?[0]
                            .astro?.moonrise ??
                        "",
                    size: 20,
                    iconSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomItem(
                    icon: Icons.water_drop_sharp,
                    text: 'Humidity',
                    textDegree:
                        widget.responseEntity.current?.humidity.toString() ??
                            "",
                    size: 20,
                    iconSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomItem(
                    icon: Icons.air,
                    text: 'Windy',
                    textDegree:
                        widget.responseEntity.current?.windKph.toString() ?? "",
                    size: 20,
                    iconSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(
                      AppRouter.forecast,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: Text(
                    "Next 7 Days Forecast",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
