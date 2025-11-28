import '../../domain/entities/event.dart';

/// Data model for Event entity
class EventModel extends Event {
  const EventModel({
    required super.id,
    required super.title,
    required super.description,
    required super.startTime,
    required super.endTime,
    required super.location,
    required super.imageUrl,
    required super.organizerId,
    required super.organizerName,
    required super.category,
    super.isFree,
    super.price,
    super.requiresApproval,
    super.visibility,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      location: json['location'] as String,
      imageUrl: json['imageUrl'] as String,
      organizerId: json['organizerId'] as String,
      organizerName: json['organizerName'] as String,
      category: json['category'] as String,
      isFree: json['isFree'] as bool? ?? true,
      price: json['price'] as double?,
      requiresApproval: json['requiresApproval'] as bool? ?? false,
      visibility: json['visibility'] as String? ?? 'public',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'location': location,
      'imageUrl': imageUrl,
      'organizerId': organizerId,
      'organizerName': organizerName,
      'category': category,
      'isFree': isFree,
      'price': price,
      'requiresApproval': requiresApproval,
      'visibility': visibility,
    };
  }

  factory EventModel.fromEntity(Event event) {
    return EventModel(
      id: event.id,
      title: event.title,
      description: event.description,
      startTime: event.startTime,
      endTime: event.endTime,
      location: event.location,
      imageUrl: event.imageUrl,
      organizerId: event.organizerId,
      organizerName: event.organizerName,
      category: event.category,
      isFree: event.isFree,
      price: event.price,
      requiresApproval: event.requiresApproval,
      visibility: event.visibility,
    );
  }
}
