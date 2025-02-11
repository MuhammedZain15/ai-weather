import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:ai_weather/features/auth/presentation/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});


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
                AppStrings.signup,
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
              height: screenHeight * 0.03,
            ),
              SignupFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
