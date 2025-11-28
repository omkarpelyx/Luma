import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/counter.dart';
import '../repositories/counter_repository.dart';

/// Use case for incrementing the counter
/// Encapsulates the business logic for incrementing
class IncrementCounter implements UseCase<Counter, NoParams> {
  const IncrementCounter(this.repository);

  final CounterRepository repository;

  @override
  Future<Either<Failure, Counter>> call(NoParams params) async {
    return await repository.incrementCounter();
  }
}
