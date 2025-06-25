import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/config/app_config.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route/app_page.dart';

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();

  // @singleton
  // Dio dio() {
  //   final dio = Dio(BaseOptions(baseUrl: AppConfig.apiBase));

  //   dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) async {
  //         final token = getIt<ICacheService>().read("bearer_token");
  //         log("Bearer Token: $token");
  //         options.headers['Authorization'] = 'Bearer $token';
  //         options.headers['Content-Type'] = 'application/json';
  //         return handler.next(options);
  //       },
  //     ),
  //   );
  //   return dio;
  // }

  @singleton
  Dio basicDio() {
    final dio = Dio(BaseOptions(baseUrl: AppConfig.apiBase));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final creds = {"username": "api", "password": "apitest"};
          final basic =
              'Basic ' +
              base64Encode(
                utf8.encode('${creds['username']}:${creds['password']}'),
              );
          options.headers['Authorization'] = basic;
          options.headers['Content-Type'] = 'application/json';
          return handler.next(options);
        },
      ),
    );
    return dio;
  }

  @lazySingleton
  GoRouter get router => getIt<AppPage>().router;
}
