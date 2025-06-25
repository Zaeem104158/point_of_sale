class ServerException implements Exception {
  final String message;
  ServerException([this.message = "Something went wrong"]);
}

class CacheException implements Exception {}

class UnauthorizedException implements Exception {}

class NetworkException implements Exception {}

class UnknownException implements Exception {}
