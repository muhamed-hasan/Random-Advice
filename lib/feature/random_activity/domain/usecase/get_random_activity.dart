import 'package:dartz/dartz.dart';
import 'package:random_activity/feature/random_activity/domain/entities/random_activity.dart';
import 'package:random_activity/feature/random_activity/domain/repositories/random_activiity_repo.dart';

import '../../../../core/errors/faliures.dart';
import '../../../../core/usecases/usecase.dart';

class GetRandomActivity {
  final RandomActivityRepo randomActivityRepository;

  GetRandomActivity(this.randomActivityRepository);
  Future<Either<Failure, RandomActivity?>?> call(NoParams params) async {
    return await randomActivityRepository.getRandomActivity();
  }
}
