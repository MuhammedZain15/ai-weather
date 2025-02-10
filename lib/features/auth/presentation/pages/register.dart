import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:ai_weather/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/custom_button.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.register_background,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: screenHeight * 0.15,
          left: screenWidth * 0.08,
          right: screenWidth * 0.08,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: screenWidth * 0.7,
              child: CustomButton(
                onClick: () {
                  GoRouter.of(context).push(AppRouter.signup);

                },
                backGroundButton: Color(0xff014bb4),
                text: AppStrings.signup,
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              width: screenWidth * 0.7,
              child: CustomButton(
                onClick: () {
                  GoRouter.of(context).push(AppRouter.login);
                },
                text: AppStrings.login,
                backGroundButton: Colors.white,
                textColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
