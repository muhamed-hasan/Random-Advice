import 'package:dartz/dartz.dart';
import 'package:random_activity/core/errors/faliures.dart';

import '../entities/random_activity.dart';

abstract class RandomActivityRepo {
  Future<Either<Failure, RandomActivity>> getRandomActivity();
}
