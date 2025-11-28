import 'package:equatable/equatable.dart';
import '../../domain/entities/counter.dart';

/// Base class for all counter states
abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any action
class CounterInitial extends CounterState {
  const CounterInitial();
}

/// State when counter is being loaded or updated
class CounterLoading extends CounterState {
  const CounterLoading();
}

/// State when counter is successfully loaded
class CounterLoaded extends CounterState {
  const CounterLoaded({required this.counter});

  final Counter counter;

  @override
  List<Object?> get props => [counter];
}

/// State when an error occurs
class CounterError extends CounterState {
  const CounterError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
