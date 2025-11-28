import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
abstract class Failure extends Equatable {
  const Failure([this.message = '']);

  final String message;

  @override
  List<Object?> get props => [message];
}

/// Failure for cache-related errors
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache failure occurred']);
}

/// Failure for server-related errors
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server failure occurred']);
}

/// Failure for network-related errors
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network failure occurred']);
}

/// Failure for validation errors
class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation failure occurred']);
}
