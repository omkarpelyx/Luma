import 'package:equatable/equatable.dart';

/// Counter entity representing the domain model
/// This is a pure domain object with no dependencies on Flutter or external packages
class Counter extends Equatable {
  const Counter({required this.value});

  final int value;

  @override
  List<Object?> get props => [value];
}
