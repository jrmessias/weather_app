import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/services/dio_openweathermap_service.dart';

class APIOpenWeatherMapService {
  APIOpenWeatherMapService._();

  factory APIOpenWeatherMapService() => _instance;

  static final APIOpenWeatherMapService _instance =
      APIOpenWeatherMapService._();

  Future<Response> getWeather(
    String endpoint, {
    String? query,
    double? latitude,
    double? longitude,
    String? units,
    String lang = "pt_BR",
  }) async {
    try {
      // "weather"
      return await dioOpenWeaterMapService().get(endpoint, queryParameters: {
        'appid': dotenv.env['OPEN_WEATHER_MAP']!,
        'lang': lang,
        'units': units,
        'q': query,
        'lat': latitude,
        'lon': longitude,
      });
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}

handleError(DioError error) {
  if (error.message.contains('SocketException')) {
    return 'Cannot connect. Check that you have internet connection';
  }

  if (error.type == DioErrorType.connectTimeout) {
    return 'Connection timed out. Please retry.';
  }

  if (error.response == null || error.response!.data is String) {
    return 'Something went wrong. Please try again later';
  }

  return 'Something went wrong. Please try again later';
}
