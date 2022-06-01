import 'dart:convert';

import 'package:random_activity/core/errors/exceptions.dart';
import 'package:random_activity/feature/random_activity/data/models/random_activity_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomActivityLocalDataSource {
  Future<void>? cacheActivity(RandomActivityModel randomActivity);
  Future<RandomActivityModel>? getLastActivity();
}

const cashedActivityKey = 'CACHED_ACTIVITY';

class RandomActivityLocalDataSourceImpl
    implements RandomActivityLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomActivityLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<bool>? cacheActivity(RandomActivityModel? randomActivity) async {
    if (randomActivity != null) {
      return sharedPreferences.setString(
          cashedActivityKey, json.encode(randomActivity.toJson()));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<RandomActivityModel>? getLastActivity() async {
    final jsonString = sharedPreferences.getString(cashedActivityKey);
    if (jsonString != null) {
      return Future.value(
          RandomActivityModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
