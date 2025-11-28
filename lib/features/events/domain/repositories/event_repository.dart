import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/event.dart';

/// Repository interface for event operations
abstract class EventRepository {
  /// Get user's events (hosting or attending)
  Future<Either<Failure, List<Event>>> getUserEvents();

  /// Get nearby events
  Future<Either<Failure, List<Event>>> getNearbyEvents();

  /// Get events by category
  Future<Either<Failure, List<Event>>> getEventsByCategory(String category);

  /// Get event by ID
  Future<Either<Failure, Event>> getEventById(String id);

  /// Create new event
  Future<Either<Failure, Event>> createEvent(Event event);
}
