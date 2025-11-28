import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/event.dart';
import '../repositories/event_repository.dart';

/// Use case for getting nearby events
class GetNearbyEvents implements UseCase<List<Event>, NoParams> {
  const GetNearbyEvents(this.repository);

  final EventRepository repository;

  @override
  Future<Either<Failure, List<Event>>> call(NoParams params) async {
    return await repository.getNearbyEvents();
  }
}
