import 'package:equatable/equatable.dart';

/// Base class for all counter events
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load the counter value
class LoadCounter extends CounterEvent {
  const LoadCounter();
}

/// Event to increment the counter
class IncrementCounterEvent extends CounterEvent {
  const IncrementCounterEvent();
}

/// Event to decrement the counter
class DecrementCounterEvent extends CounterEvent {
  const DecrementCounterEvent();
}

/// Event to reset the counter
class ResetCounterEvent extends CounterEvent {
  const ResetCounterEvent();
}
