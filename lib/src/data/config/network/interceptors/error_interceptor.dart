part of '../dio_config.dart';

class ErrorInterceptor extends Interceptor {
  final Dio dio;
  late final Dio _refreshDio;

  ErrorInterceptor(this.dio) {
    _refreshDio = Dio()
      ..interceptors.addAll(
        <Interceptor>[
          dioLoggerInterceptor,
        ],
      );
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    switch (err.type) {
      case DioExceptionType.cancel:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        break;
      case DioExceptionType.badResponse:
        // handleBadResponse(err, handler);
        break;
      case DioExceptionType.connectionError:
        break;
      case DioExceptionType.badCertificate:
        // handleServerError(err, handler);
        break;
      case DioExceptionType.unknown:
        break;
    }
  }

  // Future<void> handleServerError(DioException err, ErrorInterceptorHandler handler) async {
  //   if (err.response?.statusCode == HttpStatus.internalServerError) {
  //     final AuthDataEntity? oldAuthData = appLocator<AuthHiveProvider>().getAuthData();
  //
  //     if (oldAuthData == null) {
  //       handler.next(err);
  //     }
  //
  //     await Future.delayed(
  //       const Duration(seconds: 1),
  //       () {
  //         _retryRequests(
  //             oldAuthData!.userAccessTokens.first[oldAuthData.userAccessTokens.first.keys.first]!);
  //       },
  //     );
  //   } else {
  //     handler.next(err);
  //   }
  // }
  //
  // void handleBadResponse(DioException err, ErrorInterceptorHandler handler) {
  //   if (err.response?.statusCode == HttpStatus.unauthorized) {
  //     handle401Error(err, handler);
  //   } else {
  //     handler.next(err);
  //   }
  // }
  //
  // bool _isRefreshing = false;
  // final List<({ErrorInterceptorHandler handler, RequestOptions options})> _requestsNeedRetry =
  //     <({RequestOptions options, ErrorInterceptorHandler handler})>[];
  //
  // Future<void> handle401Error(
  //   DioException error,
  //   ErrorInterceptorHandler handler,
  // ) async {
  //   final Response<dynamic>? oldResponse = error.response;
  //
  //   if (oldResponse == null) {
  //     return handler.next(error);
  //   }
  //
  //   final AuthDataEntity? oldAuthData = appLocator<AuthHiveProvider>().getAuthData();
  //
  //   if (oldAuthData == null) {
  //     await clearDataAndResolve(error, handler);
  //     return;
  //   }
  //
  //   bool isOldTokenExpired = false;
  //   try {
  //     isOldTokenExpired = JwtDecoder.isExpired(
  //         oldAuthData.userAccessTokens.first[oldAuthData.userAccessTokens.first.keys.first]!);
  //   } catch (e) {
  //     await clearDataAndResolve(error, handler);
  //     return;
  //   }
  //
  //   if (!isOldTokenExpired) {
  //     _requestsNeedRetry.add((options: oldResponse.requestOptions, handler: handler));
  //     await _retryRequests(
  //         oldAuthData.userAccessTokens.first[oldAuthData.userAccessTokens.first.keys.first]!);
  //   } else {
  //     _requestsNeedRetry.add((options: oldResponse.requestOptions, handler: handler));
  //     if (!_isRefreshing) {
  //       _isRefreshing = true;
  //       _refreshCompleter = Completer<void>();
  //       try {
  //         final AuthDataEntity newAuthData = await _refreshToken(oldAuthData);
  //         await _retryRequests(
  //             newAuthData.userAccessTokens.first[oldAuthData.userAccessTokens.first.keys.first]!);
  //       } catch (e) {
  //         await clearDataAndResolve(error, handler);
  //       } finally {
  //         _isRefreshing = false;
  //         _refreshCompleter?.complete();
  //       }
  //     } else {
  //       await _refreshCompleter?.future;
  //       await _retryRequests(
  //           oldAuthData.userAccessTokens.first[oldAuthData.userAccessTokens.first.keys.first]!);
  //     }
  //   }
  // }
  //
  // Completer<void>? _refreshCompleter;
  //
  // Future<void> _retryRequests(String accessToken) async {
  //   for (final ({ErrorInterceptorHandler handler, RequestOptions options}) requestNeedRetry
  //       in _requestsNeedRetry) {
  //     if (requestNeedRetry.options.data is FormData) {
  //       final FormData oldFormData = requestNeedRetry.options.data;
  //       final Map<String, dynamic> newFields = <String, dynamic>{};
  //       final List<MapEntry<String, MultipartFile>> newFiles = <MapEntry<String, MultipartFile>>[];
  //
  //       for (final MapEntry<String, String> field in oldFormData.fields) {
  //         newFields[field.key] = field.value;
  //       }
  //
  //       final FormData newFormData = FormData.fromMap(newFields);
  //
  //       for (final MapEntry<String, MultipartFile> mapFile in oldFormData.files) {
  //         final MultipartFile newMultipartFile = mapFile.value.clone();
  //         newFiles.add(MapEntry<String, MultipartFile>(mapFile.key, newMultipartFile));
  //       }
  //
  //       newFormData.files.addAll(newFiles);
  //
  //       requestNeedRetry.options.data = newFormData;
  //     }
  //     requestNeedRetry.options.headers['Authorization'] = 'Bearer $accessToken';
  //     final Response<dynamic> newResponse = await dio.fetch(requestNeedRetry.options);
  //     requestNeedRetry.handler.resolve(newResponse);
  //   }
  //   _requestsNeedRetry.clear();
  // }
  //
  // Future<void> clearDataAndResolve(
  //   DioException error,
  //   ErrorInterceptorHandler handler,
  // ) async {
  //   _requestsNeedRetry.clear();
  //   handler.next(error);
  //   appLocator<MainAudioPlayerService>().deactivatePlayer();
  //   await appLocator<AppRouter>().replaceAll(<PageRouteInfo>[const SignInRoute()]);
  //   unawaited(appLocator<PushNotificationService>().clearData());
  //   unawaited(appLocator<GoogleAuthApiProvider>().signOut());
  //   if (appLocator.hasScope(authScope)) await appLocator.popScope();
  //   await appLocator<AuthHiveProvider>().deleteAuthData();
  // }
  //
  // Future<AuthDataEntity> _refreshToken(AuthDataEntity oldAuthData) async {
  //   final Response<dynamic> authResponse = await _refreshDio.post(
  //     appLocator<AppConfig>().baseUserUrl + ApiConstants.refresh,
  //     data: <String, String>{
  //       'refreshToken': oldAuthData.refreshToken,
  //     },
  //   );
  //
  //   if (authResponse.data is Map<String, dynamic>) {
  //     final AuthDataEntity newAuthData =
  //         AuthDataEntity.fromJson(authResponse.data as Map<String, dynamic>);
  //     await appLocator<AuthHiveProvider>().updateAuthData(newAuthData);
  //     return newAuthData;
  //   } else {
  //     throw Exception('Unexpected response format: ${authResponse.data}');
  //   }
  // }
}
