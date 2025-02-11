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
      backgroundColor: Color(0xff000421),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.only(
      
          left: screenWidth * 0.1,
          right: screenWidth * 0.1,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.11,
              ),
              Text(
                AppStrings.login,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                AppStrings.create_an_account,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.09,
              ),
              LoginFormWidget()
            ],
          ),
        ),
      ),
    );
  }
}
