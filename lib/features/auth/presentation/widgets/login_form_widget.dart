import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/core/components/custom_button.dart';
import 'package:ai_weather/core/components/custom_text_form_field.dart';
import 'package:ai_weather/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_strings.dart';

class LoginFormWidget extends StatefulWidget {
  LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          GoRouter.of(context).pushReplacement(AppRouter.home);
        } else if (state is LoginFailureState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Error"),
              content: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  AppStrings.password,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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
              InkWell(
                child: Text(
                  textAlign: TextAlign.right,
                  AppStrings.forget,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xff1f3a6b),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              state is LoginLoadingState
                  ? Center(child: CircularProgressIndicator())
                  : CustomButton(
                      text: AppStrings.login,
                      backGroundButton: Color(0xff014bb4),
                      textColor: Colors.white,
                      onClick: () {
                        context.read<LoginCubit>().login(
                              emailController.text,
                              passwordController.text,
                            );
                      },
                    ),
              InkWell(
                child: Text(
                  textAlign: TextAlign.center,
                  AppStrings.have_an_account,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xff1f3a6b),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
