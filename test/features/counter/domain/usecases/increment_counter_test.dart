import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:luma_event_app/core/errors/failures.dart';
import 'package:luma_event_app/core/usecases/usecase.dart';
import 'package:luma_event_app/features/counter/domain/entities/counter.dart';
import 'package:luma_event_app/features/counter/domain/repositories/counter_repository.dart';
import 'package:luma_event_app/features/counter/domain/usecases/increment_counter.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterRepository extends Mock implements CounterRepository {}

void main() {
  late IncrementCounter usecase;
  late MockCounterRepository mockRepository;

  setUp(() {
    mockRepository = MockCounterRepository();
    usecase = IncrementCounter(mockRepository);
  });

  const tCounter = Counter(value: 1);

  test('should increment counter value from repository', () async {
    // arrange
    when(
      () => mockRepository.incrementCounter(),
    ).thenAnswer((_) async => const Right(tCounter));

    // act
    final result = await usecase(const NoParams());

    // assert
    expect(result, const Right(tCounter));
    verify(() => mockRepository.incrementCounter());
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when repository fails', () async {
    // arrange
    when(
      () => mockRepository.incrementCounter(),
    ).thenAnswer((_) async => const Left(CacheFailure('Cache error')));

    // act
    final result = await usecase(const NoParams());

    // assert
    expect(result, const Left(CacheFailure('Cache error')));
    verify(() => mockRepository.incrementCounter());
    verifyNoMoreInteractions(mockRepository);
  });
}
