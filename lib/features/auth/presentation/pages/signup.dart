import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.signup_backround,
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
      ),
    );
  }
}
