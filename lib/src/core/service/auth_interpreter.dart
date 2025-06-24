// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';

// @lazySingleton
// class AuthInterceptor extends Interceptor {
//   final Future<String?> Function() getBearerToken;
//   final Future<Map<String, String>?> Function() getBasicAuthCredentials;

//   AuthInterceptor({
//     required this.getBearerToken,
//     required this.getBasicAuthCredentials,
//   });

//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     options.headers.remove('Authorization');

//     final basicAuth = await getBasicAuthCredentials();
//     if (basicAuth != null &&
//         basicAuth.containsKey('username') &&
//         basicAuth.containsKey('password')) {
//       final username = basicAuth['username']!;
//       final password = basicAuth['password']!;
//       final basicAuthValue =
//           'Basic ${base64Encode(utf8.encode('$username:$password'))}';
//       options.headers['Authorization'] = basicAuthValue;
//       handler.next(options);
//       return;
//     }

//     final token = await getBearerToken();
//     if (token != null && token.isNotEmpty) {
//       options.headers['Authorization'] = 'Bearer $token';
//     }

//     handler.next(options);
//   }
// }
