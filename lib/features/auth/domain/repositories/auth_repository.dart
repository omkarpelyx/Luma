import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

/// Repository interface for authentication operations
abstract class AuthRepository {
  /// Sign in with phone number
  Future<Either<Failure, void>> signInWithPhone(String phoneNumber);

  /// Verify OTP code
  Future<Either<Failure, User>> verifyOtp(String phoneNumber, String code);

  /// Sign in with email
  Future<Either<Failure, User>> signInWithEmail(String email, String password);

  /// Sign in with Google
  Future<Either<Failure, User>> signInWithGoogle();

  /// Sign in with Apple
  Future<Either<Failure, User>> signInWithApple();

  /// Sign out
  Future<Either<Failure, void>> signOut();

  /// Get current user
  Future<Either<Failure, User?>> getCurrentUser();

  /// Check if user is signed in
  Future<bool> isSignedIn();
}
