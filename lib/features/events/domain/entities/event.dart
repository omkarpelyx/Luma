import 'package:equatable/equatable.dart';

/// Event entity representing an event
class Event extends Equatable {
  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.imageUrl,
    required this.organizerId,
    required this.organizerName,
    required this.category,
    this.isFree = true,
    this.price,
    this.requiresApproval = false,
    this.visibility = 'public',
  });

  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final String imageUrl;
  final String organizerId;
  final String organizerName;
  final String category;
  final bool isFree;
  final double? price;
  final bool requiresApproval;
  final String visibility;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        startTime,
        endTime,
        location,
        imageUrl,
        organizerId,
        organizerName,
        category,
        isFree,
        price,
        requiresApproval,
        visibility,
      ];
}
