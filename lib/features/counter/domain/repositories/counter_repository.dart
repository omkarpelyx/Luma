import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/counter.dart';

/// Repository interface for counter operations
/// This defines the contract that data layer must implement
abstract class CounterRepository {
  /// Get the current counter value
  Future<Either<Failure, Counter>> getCounter();

  /// Increment the counter by 1
  Future<Either<Failure, Counter>> incrementCounter();

  /// Decrement the counter by 1
  Future<Either<Failure, Counter>> decrementCounter();

  /// Reset the counter to 0
  Future<Either<Failure, Counter>> resetCounter();
}
