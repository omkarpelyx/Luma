import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:luma_event_app/core/errors/failures.dart';
import 'package:luma_event_app/core/usecases/usecase.dart';
import 'package:luma_event_app/features/counter/domain/entities/counter.dart';
import 'package:luma_event_app/features/counter/domain/usecases/decrement_counter.dart';
import 'package:luma_event_app/features/counter/domain/usecases/get_counter.dart';
import 'package:luma_event_app/features/counter/domain/usecases/increment_counter.dart';
import 'package:luma_event_app/features/counter/domain/usecases/reset_counter.dart';
import 'package:luma_event_app/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:luma_event_app/features/counter/presentation/bloc/counter_event.dart';
import 'package:luma_event_app/features/counter/presentation/bloc/counter_state.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCounter extends Mock implements GetCounter {}

class MockIncrementCounter extends Mock implements IncrementCounter {}

class MockDecrementCounter extends Mock implements DecrementCounter {}

class MockResetCounter extends Mock implements ResetCounter {}

void main() {
  late CounterBloc bloc;
  late MockGetCounter mockGetCounter;
  late MockIncrementCounter mockIncrementCounter;
  late MockDecrementCounter mockDecrementCounter;
  late MockResetCounter mockResetCounter;

  setUp(() {
    mockGetCounter = MockGetCounter();
    mockIncrementCounter = MockIncrementCounter();
    mockDecrementCounter = MockDecrementCounter();
    mockResetCounter = MockResetCounter();

    bloc = CounterBloc(
      getCounter: mockGetCounter,
      incrementCounter: mockIncrementCounter,
      decrementCounter: mockDecrementCounter,
      resetCounter: mockResetCounter,
    );
  });

  setUpAll(() {
    registerFallbackValue(const NoParams());
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state should be CounterInitial', () {
    expect(bloc.state, equals(const CounterInitial()));
  });

  group('LoadCounter', () {
    const tCounter = Counter(value: 5);

    blocTest<CounterBloc, CounterState>(
      'should emit [CounterLoading, CounterLoaded] when data is gotten successfully',
      build: () {
        when(
          () => mockGetCounter(any()),
        ).thenAnswer((_) async => const Right(tCounter));
        return bloc;
      },
      act: (bloc) => bloc.add(const LoadCounter()),
      expect: () => [
        const CounterLoading(),
        const CounterLoaded(counter: tCounter),
      ],
      verify: (_) {
        verify(() => mockGetCounter(const NoParams()));
      },
    );

    blocTest<CounterBloc, CounterState>(
      'should emit [CounterLoading, CounterError] when getting data fails',
      build: () {
        when(
          () => mockGetCounter(any()),
        ).thenAnswer((_) async => const Left(CacheFailure('Cache error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const LoadCounter()),
      expect: () => [
        const CounterLoading(),
        const CounterError(message: 'Cache error'),
      ],
      verify: (_) {
        verify(() => mockGetCounter(const NoParams()));
      },
    );
  });

  group('IncrementCounterEvent', () {
    const tCounter = Counter(value: 6);

    blocTest<CounterBloc, CounterState>(
      'should emit [CounterLoading, CounterLoaded] when increment succeeds',
      build: () {
        when(
          () => mockIncrementCounter(any()),
        ).thenAnswer((_) async => const Right(tCounter));
        return bloc;
      },
      act: (bloc) => bloc.add(const IncrementCounterEvent()),
      expect: () => [
        const CounterLoading(),
        const CounterLoaded(counter: tCounter),
      ],
      verify: (_) {
        verify(() => mockIncrementCounter(const NoParams()));
      },
    );

    blocTest<CounterBloc, CounterState>(
      'should emit [CounterLoading, CounterError] when increment fails',
      build: () {
        when(() => mockIncrementCounter(any())).thenAnswer(
          (_) async => const Left(CacheFailure('Failed to increment')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const IncrementCounterEvent()),
      expect: () => [
        const CounterLoading(),
        const CounterError(message: 'Failed to increment'),
      ],
      verify: (_) {
        verify(() => mockIncrementCounter(const NoParams()));
      },
    );
  });

  group('DecrementCounterEvent', () {
    const tCounter = Counter(value: 4);

    blocTest<CounterBloc, CounterState>(
      'should emit [CounterLoading, CounterLoaded] when decrement succeeds',
      build: () {
        when(
          () => mockDecrementCounter(any()),
        ).thenAnswer((_) async => const Right(tCounter));
        return bloc;
      },
      act: (bloc) => bloc.add(const DecrementCounterEvent()),
      expect: () => [
        const CounterLoading(),
        const CounterLoaded(counter: tCounter),
      ],
      verify: (_) {
        verify(() => mockDecrementCounter(const NoParams()));
      },
    );
  });

  group('ResetCounterEvent', () {
    const tCounter = Counter(value: 0);

    blocTest<CounterBloc, CounterState>(
      'should emit [CounterLoading, CounterLoaded] when reset succeeds',
      build: () {
        when(
          () => mockResetCounter(any()),
        ).thenAnswer((_) async => const Right(tCounter));
        return bloc;
      },
      act: (bloc) => bloc.add(const ResetCounterEvent()),
      expect: () => [
        const CounterLoading(),
        const CounterLoaded(counter: tCounter),
      ],
      verify: (_) {
        verify(() => mockResetCounter(const NoParams()));
      },
    );
  });
}
