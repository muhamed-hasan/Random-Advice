import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:random_activity/core/constants/constants.dart';
import 'package:random_activity/core/errors/exceptions.dart';

import 'package:random_activity/core/errors/faliures.dart';
import 'package:random_activity/feature/random_activity/data/datasources/random_activity_remote.dart';
import 'package:random_activity/feature/random_activity/domain/entities/random_activity.dart';

import '../../../../core/connections/network_info.dart';
import '../../domain/repositories/random_activiity_repo.dart';
import '../datasources/random_activity_local.dart';

class RandomActivityRepoImp extends RandomActivityRepo {
  final RandomActivityRemoteDataSource remoteDataSource;
  final RandomActivityLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  RandomActivityRepoImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, RandomActivity>> getRandomActivity() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteActivity = await remoteDataSource.getActivity();
        localDataSource.cacheActivity(remoteActivity!);
        return Right(remoteActivity);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorMessage: Constants.server_exception));
      }
    } else {
      final localActivity = await localDataSource.getLastActivity();
      if (localActivity != null) {
        return Right(localActivity);
      } else {
        return Left(CacheFailure(errorMessage: Constants.cache_exception));
      }
    }
  }
}
