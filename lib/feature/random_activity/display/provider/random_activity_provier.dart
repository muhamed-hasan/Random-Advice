import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:random_activity/core/errors/faliures.dart';
import 'package:random_activity/feature/random_activity/data/datasources/random_activity_local.dart';
import 'package:random_activity/feature/random_activity/data/repositories/random_activity_repo_imp.dart';
import 'package:random_activity/feature/random_activity/domain/entities/random_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/connections/network_info.dart';
import '../../data/datasources/random_activity_remote.dart';

class RandomActivityProvider extends ChangeNotifier {
  RandomActivity? randomActivity;
  Failure? failure;
  RandomActivityProvider({
    this.randomActivity,
    this.failure,
  });
//
  eitherFailureOrRandomActivity() async {
    RandomActivityRepoImp repo = RandomActivityRepoImp(
      remoteDataSource: RandomActivityRemoteDataSourceImpl(Dio()),
      localDataSource: RandomActivityLocalDataSourceImpl(
          await SharedPreferences.getInstance()),
      networkInfo:
          NetworkInfoImpl(dataConnectionChecker: DataConnectionChecker()),
    );
    final failureOrActivity = await repo.getRandomActivity();

    failureOrActivity.fold(
      (newfailure) {
        failure = newfailure;
        randomActivity = null;
        notifyListeners();
      },
      (activity) {
        failure = null;
        randomActivity = activity;
        notifyListeners();
      },
    );
  }
}
