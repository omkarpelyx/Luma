import 'package:equatable/equatable.dart';
import '../../domain/entities/user.dart';

/// Base class for all auth states
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Loading state
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// User is not authenticated
class Unauthenticated extends AuthState {
  const Unauthenticated();
}

/// OTP sent successfully
class OtpSent extends AuthState {
  const OtpSent(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

/// User is authenticated
class Authenticated extends AuthState {
  const Authenticated(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

/// Authentication error
class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
