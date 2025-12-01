import 'package:equatable/equatable.dart';

/// Base class for all auth events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Event to check authentication status
class CheckAuthStatus extends AuthEvent {
  const CheckAuthStatus();
}

/// Event to sign in with phone
class SignInWithPhoneRequested extends AuthEvent {
  const SignInWithPhoneRequested(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

/// Event to verify OTP
class VerifyOtpRequested extends AuthEvent {
  const VerifyOtpRequested({required this.phoneNumber, required this.code});

  final String phoneNumber;
  final String code;

  @override
  List<Object?> get props => [phoneNumber, code];
}

/// Event to sign out
class SignOutRequested extends AuthEvent {
  const SignOutRequested();
}
