import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../models/user_model.dart';

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.localDataSource,
  });

  final AuthLocalDataSource localDataSource;

  @override
  Future<Either<Failure, void>> signInWithPhone(String phoneNumber) async {
    try {
      // TODO: Implement actual phone auth with Firebase or backend
      // For now, simulate sending OTP
      await Future.delayed(const Duration(seconds: 1));
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send OTP: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, User>> verifyOtp(
    String phoneNumber,
    String code,
  ) async {
    try {
      // TODO: Implement actual OTP verification
      // For now, create a mock user
      final user = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Omkar',
        phoneNumber: phoneNumber,
        joinedDate: DateTime.now(),
        hostedCount: 0,
        attendedCount: 0,
      );

      await localDataSource.cacheUser(user);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure('Failed to verify OTP: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      // TODO: Implement email auth
      throw UnimplementedError();
    } catch (e) {
      return const Left(ServerFailure('Email sign-in not implemented'));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      // TODO: Implement Google sign-in
      throw UnimplementedError();
    } catch (e) {
      return const Left(ServerFailure('Google sign-in not implemented'));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithApple() async {
    try {
      // TODO: Implement Apple sign-in
      throw UnimplementedError();
    } catch (e) {
      return const Left(ServerFailure('Apple sign-in not implemented'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await localDataSource.clearUser();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to sign out: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final user = await localDataSource.getCachedUser();
      return Right(user);
    } catch (e) {
      return Left(CacheFailure('Failed to get user: ${e.toString()}'));
    }
  }

  @override
  Future<bool> isSignedIn() async {
    return await localDataSource.isSignedIn();
  }
}
