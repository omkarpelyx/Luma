import '../../domain/entities/counter.dart';

/// Data model for Counter entity
/// Extends the domain entity and adds serialization capabilities
class CounterModel extends Counter {
  const CounterModel({required super.value});

  /// Create a CounterModel from JSON
  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(
      value: json['value'] as int,
    );
  }

  /// Convert CounterModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }

  /// Create a CounterModel from a Counter entity
  factory CounterModel.fromEntity(Counter counter) {
    return CounterModel(value: counter.value);
  }
}
