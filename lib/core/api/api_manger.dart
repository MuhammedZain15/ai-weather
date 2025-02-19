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

  Future<Response> getForecast(String city,
      {Map<String, dynamic>? headers}) {
    return dio.get(
      'http://api.weatherapi.com/v1/forecast.json?key=da8379bc78124e0190a112307251702&q=$city&days=7',
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }
}
