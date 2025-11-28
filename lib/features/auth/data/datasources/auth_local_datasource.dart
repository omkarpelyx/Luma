import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

/// Contract for local auth data source operations
abstract class AuthLocalDataSource {
  Future<UserModel?> getCachedUser();
  Future<void> cacheUser(UserModel user);
  Future<void> clearUser();
  Future<bool> isSignedIn();
}

const String cachedUserKey = 'CACHED_USER';
const String isSignedInKey = 'IS_SIGNED_IN';

/// Implementation of AuthLocalDataSource using SharedPreferences
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<UserModel?> getCachedUser() async {
    final jsonString = sharedPreferences.getString(cachedUserKey);
    if (jsonString != null) {
      return UserModel.fromJson(
        json.decode(jsonString) as Map<String, dynamic>,
      );
    }
    return null;
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    await sharedPreferences.setString(
      cachedUserKey,
      json.encode(user.toJson()),
    );
    await sharedPreferences.setBool(isSignedInKey, true);
  }

  @override
  Future<void> clearUser() async {
    await sharedPreferences.remove(cachedUserKey);
    await sharedPreferences.setBool(isSignedInKey, false);
  }

  @override
  Future<bool> isSignedIn() async {
    return sharedPreferences.getBool(isSignedInKey) ?? false;
  }
}
