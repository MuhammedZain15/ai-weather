import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.weatherDay,
    required this.maxTemp,
    required this.data,
    required this.minTemp,
  });

  final String imagePath;

  final String weatherDay;
  final String data;
  final String maxTemp;

  final String minTemp;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03, vertical: screenHeight * 0.01),
      leading: Image.network(
        "http:$imagePath",
        width: screenWidth * 0.1,
        height: screenWidth * 0.1,
        fit: BoxFit.cover,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$data",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "AVG: ${(weatherDay)}°",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Max: $maxTemp°",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Min: $minTemp°",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
