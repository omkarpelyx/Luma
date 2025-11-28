import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/counter.dart';
import '../../domain/repositories/counter_repository.dart';
import '../datasources/counter_local_datasource.dart';
import '../models/counter_model.dart';

/// Implementation of CounterRepository
/// Handles data operations and error handling
class CounterRepositoryImpl implements CounterRepository {
  const CounterRepositoryImpl({
    required this.localDataSource,
  });

  final CounterLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Counter>> getCounter() async {
    try {
      final counterModel = await localDataSource.getCounter();
      return Right(counterModel);
    } on CacheException {
      return const Left(CacheFailure('Failed to get counter from cache'));
    } catch (e) {
      return Left(CacheFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Counter>> incrementCounter() async {
    try {
      final currentCounter = await localDataSource.getCounter();
      final newCounter = CounterModel(value: currentCounter.value + 1);
      await localDataSource.cacheCounter(newCounter);
      return Right(newCounter);
    } on CacheException {
      return const Left(CacheFailure('Failed to increment counter'));
    } catch (e) {
      return Left(CacheFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Counter>> decrementCounter() async {
    try {
      final currentCounter = await localDataSource.getCounter();
      final newCounter = CounterModel(value: currentCounter.value - 1);
      await localDataSource.cacheCounter(newCounter);
      return Right(newCounter);
    } on CacheException {
      return const Left(CacheFailure('Failed to decrement counter'));
    } catch (e) {
      return Left(CacheFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Counter>> resetCounter() async {
    try {
      const newCounter = CounterModel(value: 0);
      await localDataSource.cacheCounter(newCounter);
      return const Right(newCounter);
    } on CacheException {
      return const Left(CacheFailure('Failed to reset counter'));
    } catch (e) {
      return Left(CacheFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
