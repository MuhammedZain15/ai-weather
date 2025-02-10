import 'package:ai_weather/core/components/custom_button.dart';
import 'package:ai_weather/core/components/custom_text_form_field.dart';
import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SignupFormWidget extends StatelessWidget {
  SignupFormWidget({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                AppStrings.full_name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomTextFormField(
              controller: nameController,
              filledColor: Color(0xff243350).withOpacity(0.9),
              obscured: false,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                AppStrings.email,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomTextFormField(
              controller: emailController,
              filledColor: Color(0xff243350).withOpacity(0.9),
              obscured: false,
              validation: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please Enter Your Email";
                }
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return "Please Enter A Valid Email";
                }
                return null;
              },
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                AppStrings.password,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            CustomTextFormField(
              controller: passwordController,
              filledColor: Color(0xff243350).withOpacity(0.9),
              obscured: true,
              validation: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please Enter Your Password";
                }
                return null;
              },
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            CustomButton(
              text: AppStrings.signup,
              backGroundButton: Color(0xff014bb4),
              textColor: Colors.white,
              onClick: () {},
            ),
            InkWell(
              child: Text(
                textAlign: TextAlign.center,
                AppStrings.have_an_account,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
