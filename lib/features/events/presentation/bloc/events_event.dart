import 'package:equatable/equatable.dart';

/// Base class for all events events
abstract class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load user events
class LoadUserEvents extends EventsEvent {
  const LoadUserEvents();
}

/// Event to load nearby events
class LoadNearbyEvents extends EventsEvent {
  const LoadNearbyEvents();
}

/// Event to load events by category
class LoadEventsByCategory extends EventsEvent {
  const LoadEventsByCategory(this.category);

  final String category;

  @override
  List<Object?> get props => [category];
}

/// Event to refresh events
class RefreshEvents extends EventsEvent {
  const RefreshEvents();
}
