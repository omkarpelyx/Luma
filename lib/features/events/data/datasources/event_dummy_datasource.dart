import '../models/event_model.dart';

/// Dummy data source for events
class EventDummyDataSource {
  /// Get dummy nearby events
  Future<List<EventModel>> getNearbyEvents() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _dummyEvents;
  }

  /// Get dummy user events
  Future<List<EventModel>> getUserEvents() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return []; // User has no events initially
  }

  /// Get dummy events by category
  Future<List<EventModel>> getEventsByCategory(String category) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _dummyEvents
        .where((event) =>
            event.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  /// Dummy events data with real images
  static final List<EventModel> _dummyEvents = [
    EventModel(
      id: '1',
      title: 'Code & Connect 3.0 (Delhi Edition)',
      description:
          'Join us for an evening of coding, networking, and learning. Meet fellow developers and build amazing projects together.',
      startTime: DateTime(2024, 11, 29, 11, 0),
      endTime: DateTime(2024, 11, 29, 17, 0),
      location: 'VLIV Women Residence, Delhi',
      imageUrl: 'assets/images/event1.jpg',
      organizerId: 'org1',
      organizerName: 'SheBuilds and Nikita kumari',
      category: 'Tech',
      isFree: true,
    ),
    EventModel(
      id: '2',
      title: 'FutureXcon - Fueling Ideas. Funding Vision. Forging Change.',
      description:
          'A premier conference bringing together innovators, investors, and entrepreneurs to shape the future of technology and business.',
      startTime: DateTime(2024, 12, 6, 12, 0),
      endTime: DateTime(2024, 12, 6, 18, 0),
      location: 'New Delhi, Delhi',
      imageUrl: 'assets/images/event2.jpg',
      organizerId: 'org2',
      organizerName: 'AI x Web3',
      category: 'Tech',
      isFree: false,
      price: 499.0,
    ),
    EventModel(
      id: '3',
      title: "Founders' Stories",
      description:
          'Hear inspiring stories from successful founders who have built amazing companies from scratch. Learn from their experiences and mistakes.',
      startTime: DateTime(2024, 12, 6, 16, 0),
      endTime: DateTime(2024, 12, 6, 19, 0),
      location: 'Gurugram, Haryana',
      imageUrl: 'assets/images/event3.jpg',
      organizerId: 'org3',
      organizerName: 'Shubham Gupta',
      category: 'Tech',
      isFree: true,
    ),
    EventModel(
      id: '4',
      title: 'Stable Money India Tour ft. LLA | Noida (Delhi NCR) Edition',
      description:
          'Learn about stable money investments and financial planning. Meet experts and get your questions answered.',
      startTime: DateTime(2026, 1, 10, 14, 0),
      endTime: DateTime(2026, 1, 10, 17, 0),
      location: 'Noida, Delhi NCR',
      imageUrl: 'assets/images/event4.jpg',
      organizerId: 'org4',
      organizerName: 'Stable Money India Tour',
      category: 'Finance',
      isFree: true,
    ),
    EventModel(
      id: '5',
      title: 'AI Summit 2024',
      description:
          'Explore the latest in artificial intelligence and machine learning. Network with AI researchers and practitioners.',
      startTime: DateTime(2024, 12, 15, 9, 0),
      endTime: DateTime(2024, 12, 15, 18, 0),
      location: 'Bangalore, Karnataka',
      imageUrl: 'assets/images/event5.jpg',
      organizerId: 'org5',
      organizerName: 'AI Community India',
      category: 'AI',
      isFree: false,
      price: 999.0,
    ),
    EventModel(
      id: '6',
      title: 'Climate Action Workshop',
      description:
          'Join us to discuss climate change solutions and sustainable practices. Make a difference in your community.',
      startTime: DateTime(2024, 12, 20, 10, 0),
      endTime: DateTime(2024, 12, 20, 16, 0),
      location: 'Mumbai, Maharashtra',
      imageUrl: 'assets/images/event6.jpg',
      organizerId: 'org6',
      organizerName: 'Green Earth Initiative',
      category: 'Climate',
      isFree: true,
    ),
  ];
}
