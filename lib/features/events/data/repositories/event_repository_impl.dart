import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/event.dart';
import '../../domain/repositories/event_repository.dart';
import '../datasources/event_dummy_datasource.dart';

/// Implementation of EventRepository using dummy data
class EventRepositoryImpl implements EventRepository {
  const EventRepositoryImpl({required this.dummyDataSource});

  final EventDummyDataSource dummyDataSource;

  @override
  Future<Either<Failure, List<Event>>> getUserEvents() async {
    try {
      final events = await dummyDataSource.getUserEvents();
      return Right(events);
    } catch (e) {
      return Left(CacheFailure('Failed to get user events: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Event>>> getNearbyEvents() async {
    try {
      final events = await dummyDataSource.getNearbyEvents();
      return Right(events);
    } catch (e) {
      return Left(
        ServerFailure('Failed to get nearby events: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Event>>> getEventsByCategory(
    String category,
  ) async {
    try {
      final events = await dummyDataSource.getEventsByCategory(category);
      return Right(events);
    } catch (e) {
      return Left(
        ServerFailure('Failed to get events by category: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, Event>> getEventById(String id) async {
    try {
      final events = await dummyDataSource.getNearbyEvents();
      final event = events.firstWhere((e) => e.id == id);
      return Right(event);
    } catch (e) {
      return Left(ServerFailure('Event not found: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Event>> createEvent(Event event) async {
    try {
      // Simulate event creation
      await Future.delayed(const Duration(seconds: 1));
      return Right(event);
    } catch (e) {
      return Left(ServerFailure('Failed to create event: ${e.toString()}'));
    }
  }
}
