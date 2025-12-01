import 'package:equatable/equatable.dart';
import '../../domain/entities/event.dart';

/// Base class for all events states
abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class EventsInitial extends EventsState {
  const EventsInitial();
}

/// Loading state
class EventsLoading extends EventsState {
  const EventsLoading();
}

/// Events loaded successfully
class EventsLoaded extends EventsState {
  const EventsLoaded({required this.userEvents, required this.nearbyEvents});

  final List<Event> userEvents;
  final List<Event> nearbyEvents;

  @override
  List<Object?> get props => [userEvents, nearbyEvents];
}

/// Error state
class EventsError extends EventsState {
  const EventsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
