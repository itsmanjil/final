// state management
import 'package:dio/dio.dart';
import 'package:second_hand_shop/utils/url.dart';

class HttpServices {
  static final HttpServices _instance = HttpServices.internal();
  factory HttpServices() => _instance;
  HttpServices.internal();

  Dio? _dio;
  Dio getDioInstance() {
    if (_dio == null) {
      return Dio(
        BaseOptions(baseUrl: baseUrl, connectTimeout: 5000),
      );
    } else {
      return _dio!;
    }
  }
}
