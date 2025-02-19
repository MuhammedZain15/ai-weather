import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  WeatherWidget({
    super.key,
    required this.imagePath,
    required this.text,
    required this.textDegree,
  });

  String imagePath;

  String text;
  String textDegree;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Image.network(
          'http:${imagePath}',
          width: screenWidth * 0.1,

        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          textDegree,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
