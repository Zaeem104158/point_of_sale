import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:point_of_sale/src/core/config/app_config.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/service/database_service.dart';
import 'package:point_of_sale/src/shared/widgets/loader_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route/app_page.dart';

@module
abstract class AppModule {
  @lazySingleton
  Logger get logger =>
      Logger(printer: PrettyPrinter(), filter: DevelopmentFilter());

  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();

  @preResolve
  Future<ObjectBoxService> get objectBoxService async {
    final service = ObjectBoxService();
    await service.init();
    return service;
  }

  @lazySingleton
  Widget get loader => getIt<LoaderWidget>();

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
