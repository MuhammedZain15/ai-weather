import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/core/components/custom_button.dart';
import 'package:ai_weather/core/components/custom_text_form_field.dart';
import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:ai_weather/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccessState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Success"),
                content: Text("Account created successfully!"),
              ),
            );
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop(); // Close dialog
              GoRouter.of(context).pushReplacement(AppRouter.login);
            });
          } else if (state is SignupIFailureState) {
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
          return Column(
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
              SizedBox(height: screenHeight * 0.02),
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
              ),
              SizedBox(height: screenHeight * 0.01),
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
              SizedBox(height: screenHeight * 0.04),
              state is SignupLoadingState
                  ? Center(child: CircularProgressIndicator())
                  : CustomButton(
                      text: AppStrings.signup,
                      backGroundButton: Color(0xff014bb4),
                      textColor: Colors.white,
                      onClick: () {
                        context.read<SignupCubit>().signup(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                            );
                      },
                    ),
              InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.login);
                },
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
          );
        },
      ),
    );
  }
}
