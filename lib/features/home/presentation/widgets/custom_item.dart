import 'dart:ui';

import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  CustomItem({
    super.key,
    required this.icon,
    this.iconSize,
    this.size,
    required this.text,
    required this.textDegree,
    this.color,
    this.fontWeight,
  });

  IconData icon;
  double? iconSize;
  double? size;
  String text;
  String textDegree;
  Color? color;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Flexible(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Container(
            padding: EdgeInsets.all(screenHeight * 0.02),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: [
                  Color(0xff1D3C6A).withOpacity(0.5),
                  Color(0xff5C4D7D).withOpacity(0.2)
                ],
              ),
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: iconSize,
                ),
                Flexible(
                    child: Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: size,
                    fontWeight: fontWeight,
                  ),
                )),
                Flexible(
                    child: Text(
                  textDegree,
                  style: TextStyle(
                    color: color,
                    fontSize: size,
                    fontWeight: fontWeight,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
