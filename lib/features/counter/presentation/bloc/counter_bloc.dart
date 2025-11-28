import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/decrement_counter.dart';
import '../../domain/usecases/get_counter.dart';
import '../../domain/usecases/increment_counter.dart';
import '../../domain/usecases/reset_counter.dart';
import 'counter_event.dart';
import 'counter_state.dart';

/// BLoC for managing counter state
/// Only contains presentation logic, delegates business logic to use cases
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc({
    required this.getCounter,
    required this.incrementCounter,
    required this.decrementCounter,
    required this.resetCounter,
  }) : super(const CounterInitial()) {
    on<LoadCounter>(_onLoadCounter);
    on<IncrementCounterEvent>(_onIncrementCounter);
    on<DecrementCounterEvent>(_onDecrementCounter);
    on<ResetCounterEvent>(_onResetCounter);
  }

  final GetCounter getCounter;
  final IncrementCounter incrementCounter;
  final DecrementCounter decrementCounter;
  final ResetCounter resetCounter;

  Future<void> _onLoadCounter(
    LoadCounter event,
    Emitter<CounterState> emit,
  ) async {
    emit(const CounterLoading());
    final result = await getCounter(const NoParams());
    result.fold(
      (failure) => emit(CounterError(message: failure.message)),
      (counter) => emit(CounterLoaded(counter: counter)),
    );
  }

  Future<void> _onIncrementCounter(
    IncrementCounterEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(const CounterLoading());
    final result = await incrementCounter(const NoParams());
    result.fold(
      (failure) => emit(CounterError(message: failure.message)),
      (counter) => emit(CounterLoaded(counter: counter)),
    );
  }

  Future<void> _onDecrementCounter(
    DecrementCounterEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(const CounterLoading());
    final result = await decrementCounter(const NoParams());
    result.fold(
      (failure) => emit(CounterError(message: failure.message)),
      (counter) => emit(CounterLoaded(counter: counter)),
    );
  }

  Future<void> _onResetCounter(
    ResetCounterEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(const CounterLoading());
    final result = await resetCounter(const NoParams());
    result.fold(
      (failure) => emit(CounterError(message: failure.message)),
      (counter) => emit(CounterLoaded(counter: counter)),
    );
  }
}
