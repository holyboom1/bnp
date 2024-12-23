part of '../dio_config.dart';

class RequestInterceptor extends Interceptor {
  final Dio dio;

  RequestInterceptor(this.dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // if (options.uri.path.contains(ApiConstants.generateImage)) {
    //   options.connectTimeout = const Duration(minutes: 10);
    // } else {
    //   options.connectTimeout = const Duration(seconds: 10);
    // }
    //
    // final AuthDataEntity? authData = appLocator<AuthHiveProvider>().getAuthData();
    // if (authData != null) {
    //   final bool isNeedToUseAccountToken =
    //       await appLocator<AccountTokenUsageHiveProvider>().getIsNeedToUseAccountToken();
    //   if (isNeedToUseAccountToken) {
    //     options.headers['Authorization'] = 'Bearer ${authData.accountAccessToken}';
    //   } else {
    //     options.headers['Authorization'] =
    //         'Bearer ${authData.userAccessTokens.first[authData.userAccessTokens.first.keys.first]}';
    //   }
    // }
    return handler.next(options);
  }
}
