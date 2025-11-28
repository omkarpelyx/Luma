import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/counter.dart';
import '../repositories/counter_repository.dart';

/// Use case for resetting the counter to zero
class ResetCounter implements UseCase<Counter, NoParams> {
  const ResetCounter(this.repository);

  final CounterRepository repository;

  @override
  Future<Either<Failure, Counter>> call(NoParams params) async {
    return await repository.resetCounter();
  }
}
