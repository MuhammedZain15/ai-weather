import 'package:ai_weather/core/components/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_router/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000421),
      body: Center(
        child: CustomButton(
          text: "Sign out",
          backGroundButton: Colors.red,
          textColor: Colors.white,
          onClick: () {
            FirebaseAuth.instance.signOut();
            GoRouter.of(context).push(AppRouter.login);
          },
        ),
      ),
    );
  }
}
