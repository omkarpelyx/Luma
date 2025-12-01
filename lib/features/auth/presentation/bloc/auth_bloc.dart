import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/sign_in_with_phone.dart';
import '../../domain/usecases/verify_otp.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// BLoC for managing authentication state
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.getCurrentUser,
    required this.signInWithPhone,
    required this.verifyOtp,
  }) : super(const AuthInitial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<SignInWithPhoneRequested>(_onSignInWithPhoneRequested);
    on<VerifyOtpRequested>(_onVerifyOtpRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  final GetCurrentUser getCurrentUser;
  final SignInWithPhone signInWithPhone;
  final VerifyOtp verifyOtp;

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await getCurrentUser(const NoParams());
    result.fold((failure) => emit(const Unauthenticated()), (user) {
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(const Unauthenticated());
      }
    });
  }

  Future<void> _onSignInWithPhoneRequested(
    SignInWithPhoneRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await signInWithPhone(
      SignInWithPhoneParams(phoneNumber: event.phoneNumber),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(OtpSent(event.phoneNumber)),
    );
  }

  Future<void> _onVerifyOtpRequested(
    VerifyOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await verifyOtp(
      VerifyOtpParams(phoneNumber: event.phoneNumber, code: event.code),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    // TODO: Implement sign out use case
    emit(const Unauthenticated());
  }
}
