import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/constants/app_constants.dart';

Dio dioOpenWeaterMapService({
  int connectTimeout = 8000,
  int receiveTimeout = 5000,
}) {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.urlOpenWeaterMap,
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        "Accept": "*/*",
        "Content-Type": "application/json",
        "Connection": "keep-alive",
      },
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    ),
  );
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) async {
        debugPrint(
          '=> REQUEST[${options.method}]\n'
          '=> URI: ${options.uri}\n'
          '=> DATA: ${options.data}\n'
          '=> HEADERS: ${options.headers}',
        );
        return handler.next(options);
      },
      onResponse: (
        Response response,
        ResponseInterceptorHandler handler,
      ) async {
        debugPrint(
          '=> RESPONSE[${response.statusCode}]\n'
          '=> HEADERS: ${response.headers}\n'
          '=> DATA: ${response.data}\n',
        );
        return handler.next(response);
      },
      onError: (
        DioError err,
        ErrorInterceptorHandler handler,
      ) async {
        debugPrint(
          '=> ERROR[${err.response?.statusCode}]\n'
          '=> MESSAGE: ${err.response?.statusMessage}',
        );
        return handler.next(err);
      },
    ),
  );

  debugPrint("");
  return dio;
}
