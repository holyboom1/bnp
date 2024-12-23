import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import 'interceptors/dio_log_interceptor.dart';

part 'interceptors/error_interceptor.dart';
part 'interceptors/request_interceptor.dart';
part 'interceptors/response_interceptor.dart';

class DioConfig {
  static const Duration timeout = Duration(seconds: 10);

  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioConfig() {
    _dio
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout
      ..interceptors.addAll(
        <Interceptor>[
          RequestInterceptor(_dio),
          ErrorInterceptor(_dio),
          ResponseInterceptor(_dio),
          dioLoggerInterceptor,
        ],
      );
  }
}
