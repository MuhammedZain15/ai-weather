import 'package:ai_weather/core/utils/assets.dart';
import 'package:ai_weather/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.login_backround),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.02,
            left: screenWidth * 0.08,
            right: screenWidth * 0.08,
          ),
          child: Column(
            children: [
              Text(
                AppStrings.login,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                AppStrings.create_an_account,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: screenHeight * 0.22),
              LoginFormWidget()
            ],
          ),
        ),
      ),
    );
  }
}
