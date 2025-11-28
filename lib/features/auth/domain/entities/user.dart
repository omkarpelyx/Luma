import 'package:equatable/equatable.dart';

/// User entity representing authenticated user
class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    this.email,
    this.phoneNumber,
    this.profileImageUrl,
    this.joinedDate,
    this.hostedCount = 0,
    this.attendedCount = 0,
  });

  final String id;
  final String name;
  final String? email;
  final String? phoneNumber;
  final String? profileImageUrl;
  final DateTime? joinedDate;
  final int hostedCount;
  final int attendedCount;

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        profileImageUrl,
        joinedDate,
        hostedCount,
        attendedCount,
      ];
}
