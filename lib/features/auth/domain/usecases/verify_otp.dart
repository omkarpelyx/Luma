import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Use case for verifying OTP code
class VerifyOtp implements UseCase<User, VerifyOtpParams> {
  const VerifyOtp(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, User>> call(VerifyOtpParams params) async {
    return await repository.verifyOtp(params.phoneNumber, params.code);
  }
}

class VerifyOtpParams extends Equatable {
  const VerifyOtpParams({
    required this.phoneNumber,
    required this.code,
  });

  final String phoneNumber;
  final String code;

  @override
  List<Object?> get props => [phoneNumber, code];
}
