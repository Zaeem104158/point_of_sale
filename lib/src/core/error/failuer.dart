abstract class Failure {
  final String message;
  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure([super.msg = 'No Internet connection']);
}

class ServerFailure extends Failure {
  ServerFailure([super.msg = 'Server error']);
}

class CacheFailure extends Failure {
  CacheFailure([super.msg = 'Failed to access local cache']);
}

class ValidationFailure extends Failure {
  ValidationFailure([super.msg = 'Invalid input']);
}

class AuthFailure extends Failure {
  AuthFailure([super.msg = 'Authentication failed']);
}

class UnknownFailure extends Failure {
  UnknownFailure([super.msg = 'Unknown error']);
}
