import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_nearby_events.dart';
import '../../domain/usecases/get_user_events.dart';
import 'events_event.dart';
import 'events_state.dart';

/// BLoC for managing events state
class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc({required this.getUserEvents, required this.getNearbyEvents})
    : super(const EventsInitial()) {
    on<LoadUserEvents>(_onLoadUserEvents);
    on<LoadNearbyEvents>(_onLoadNearbyEvents);
    on<RefreshEvents>(_onRefreshEvents);
  }

  final GetUserEvents getUserEvents;
  final GetNearbyEvents getNearbyEvents;

  Future<void> _onLoadUserEvents(
    LoadUserEvents event,
    Emitter<EventsState> emit,
  ) async {
    emit(const EventsLoading());
    final userEventsResult = await getUserEvents(const NoParams());
    final nearbyEventsResult = await getNearbyEvents(const NoParams());

    userEventsResult.fold((failure) => emit(EventsError(failure.message)), (
      userEvents,
    ) {
      nearbyEventsResult.fold(
        (failure) => emit(EventsError(failure.message)),
        (nearbyEvents) => emit(
          EventsLoaded(userEvents: userEvents, nearbyEvents: nearbyEvents),
        ),
      );
    });
  }

  Future<void> _onLoadNearbyEvents(
    LoadNearbyEvents event,
    Emitter<EventsState> emit,
  ) async {
    emit(const EventsLoading());
    final result = await getNearbyEvents(const NoParams());
    result.fold(
      (failure) => emit(EventsError(failure.message)),
      (events) =>
          emit(EventsLoaded(userEvents: const [], nearbyEvents: events)),
    );
  }

  Future<void> _onRefreshEvents(
    RefreshEvents event,
    Emitter<EventsState> emit,
  ) async {
    // Reload both user and nearby events
    add(const LoadUserEvents());
  }
}
