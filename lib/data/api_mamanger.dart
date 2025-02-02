import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:scalapay/data/endpoints.dart';

class ApiManager {
  final _receiveTimeout = const Duration(seconds: 5);
  final _connectTimeout = const Duration(seconds: 5);
  final _sendTimeout = const Duration(seconds: 5);

  late Dio _dio;
  ApiManager._internal();
  static final ApiManager _apiManager = ApiManager._internal();
  factory ApiManager() => _apiManager;

  Dio provideDio() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Endpoints.baseUrl,
      receiveTimeout: _receiveTimeout,
      connectTimeout: _connectTimeout,
      sendTimeout: _sendTimeout,
    );

    // Per comodità faccio il log delle chiamate API per vederle in console
    PrettyDioLogger prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );

    _dio = Dio(baseOptions);

    _dio.interceptors.addAll({
      prettyDioLogger,
    });

    return _dio;
  }
}
