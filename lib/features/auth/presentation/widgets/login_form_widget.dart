import 'package:ai_weather/core/components/custom_button.dart';
import 'package:ai_weather/core/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  AppStrings.email,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTextFormField(
                controller: emailController,
                filledColor: Colors.grey[300],
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
                height: screenHeight * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  AppStrings.password,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTextFormField(
                controller: passwordController,
                filledColor: Colors.grey[300],
                obscured: true,
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please Enter Your Password";
                  }
                  return null;
                },
              ),
              InkWell(
                child: Text(
                  textAlign: TextAlign.right,
                  AppStrings.forget,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              CustomButton(
                text: AppStrings.login,
                backGroundButton: Color(0xff014bb4),
                textColor: Colors.white,
                onClick: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
