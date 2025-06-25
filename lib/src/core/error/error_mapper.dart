import 'dart:io';

import 'package:dio/dio.dart';
import 'package:point_of_sale/src/core/error/exception.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';

Failure mapExceptionToFailure(Exception e) {
  if (e is ServerException) return ServerFailure(e.message);
  if (e is CacheException) return CacheFailure();
  if (e is UnauthorizedException) return AuthFailure("Session expired");
  if (e is NetworkException) return NetworkFailure();

  // Dio (HTTP) exceptions
  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure("Connection timed out");

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode ?? 0;
        final message = e.response?.data['message'] ?? 'Server error';
        if (statusCode == 401 || statusCode == 403) {
          return AuthFailure("Unauthorized request");
        }
        return ServerFailure("Error $statusCode: $message");

      case DioExceptionType.connectionError:
        return NetworkFailure("No Internet connection");

      case DioExceptionType.cancel:
        return UnknownFailure("Request was cancelled");

      case DioExceptionType.unknown:
      default:
        if (e.error is SocketException) {
          return NetworkFailure("No Internet connection");
        }
        return UnknownFailure("Unexpected error: ${e.message}");
    }
  }

  // Fallback: Socket error
  if (e is SocketException) {
    return NetworkFailure("No Internet connection");
  }

  // Unknown exception fallback
  return UnknownFailure("Unexpected error occurred");
}
