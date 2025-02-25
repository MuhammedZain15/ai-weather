import 'package:ai_weather/features/home/domain/entities/ResponseEntity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiManger {
  late Dio dio;

  ApiManger() {
    dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Future<Response> getWeather({
    Map<String, dynamic>? headers,
    String? city,
  }) {
    String endpoint = city != null
        ? 'http://api.weatherapi.com/v1/forecast.json?key=da8379bc78124e0190a112307251702&q=$city&aqi=no'
        : 'http://api.weatherapi.com/v1/forecast.json?key=da8379bc78124e0190a112307251702&q=London&aqi=no';
    return dio.get(
      endpoint,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> getForecast(String city, {Map<String, dynamic>? headers}) {
    return dio.get(
      'http://api.weatherapi.com/v1/forecast.json?key=da8379bc78124e0190a112307251702&q=$city&days=7',
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }

  Future<List<dynamic>> getPredictionFromWeatherData(
      ResponseEntity weatherData) async {
    const String url = 'http://192.168.1.5:5001/predict';

    // Convert API weather data to AI model input format
    List<int> features = _convertWeatherToFeatures(weatherData);
    print(features);

    // Create the request body
    Map<String, dynamic> body = {
      'features': [features] // Wrap in a list to make it a 2D array
    };

    try {
      final response = await dio.post(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: body,
      );

      if (response.statusCode == 200) {
        return response.data['prediction']; // Returns a list<dynamic>
      } else {
        throw Exception('Failed to get prediction: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching prediction: $e');
    }
  }

  List<int> _convertWeatherToFeatures(ResponseEntity weatherData) {
    return [
      weatherData.current?.cloud != null && weatherData.current!.cloud! > 50
          ? 1
          : 0, // Rainy
      weatherData.current?.cloud != null && weatherData.current!.cloud! < 50
          ? 1
          : 0, // Sunny
      weatherData.current?.tempC != null && weatherData.current!.tempC! > 30
          ? 1
          : 0, // Hot
      weatherData.current?.tempC != null &&
              weatherData.current!.tempC! >= 15 &&
              weatherData.current!.tempC! <= 30
          ? 1
          : 0, // Mild
      weatherData.current?.humidity != null &&
              weatherData.current!.humidity! < 70
          ? 1
          : 0, // Normal Humidity
    ];
  }
}
