import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/counter_model.dart';

/// Contract for local data source operations
abstract class CounterLocalDataSource {
  /// Get the cached counter value
  /// Throws [CacheException] if no cached data is found
  Future<CounterModel> getCounter();

  /// Cache the counter value
  Future<void> cacheCounter(CounterModel counterModel);
}

const String cachedCounterKey = 'CACHED_COUNTER';

/// Implementation of CounterLocalDataSource using SharedPreferences
class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  const CounterLocalDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<CounterModel> getCounter() async {
    final jsonString = sharedPreferences.getString(cachedCounterKey);
    if (jsonString != null) {
      return CounterModel.fromJson(
        json.decode(jsonString) as Map<String, dynamic>,
      );
    } else {
      // Return default counter if no cached value
      return const CounterModel(value: 0);
    }
  }

  @override
  Future<void> cacheCounter(CounterModel counterModel) async {
    await sharedPreferences.setString(
      cachedCounterKey,
      json.encode(counterModel.toJson()),
    );
  }
}

/// Exception thrown when cache operations fail
class CacheException implements Exception {
  const CacheException([this.message = 'Cache exception occurred']);

  final String message;
}
