import '../../domain/entities/user.dart';

/// Data model for User entity
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    super.email,
    super.phoneNumber,
    super.profileImageUrl,
    super.joinedDate,
    super.hostedCount,
    super.attendedCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      joinedDate: json['joinedDate'] != null
          ? DateTime.parse(json['joinedDate'] as String)
          : null,
      hostedCount: json['hostedCount'] as int? ?? 0,
      attendedCount: json['attendedCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImageUrl': profileImageUrl,
      'joinedDate': joinedDate?.toIso8601String(),
      'hostedCount': hostedCount,
      'attendedCount': attendedCount,
    };
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      phoneNumber: user.phoneNumber,
      profileImageUrl: user.profileImageUrl,
      joinedDate: user.joinedDate,
      hostedCount: user.hostedCount,
      attendedCount: user.attendedCount,
    );
  }
}
