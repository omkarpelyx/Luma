import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

/// Use case for signing in with phone number
class SignInWithPhone implements UseCase<void, SignInWithPhoneParams> {
  const SignInWithPhone(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, void>> call(SignInWithPhoneParams params) async {
    return await repository.signInWithPhone(params.phoneNumber);
  }
}

class SignInWithPhoneParams extends Equatable {
  const SignInWithPhoneParams({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}
