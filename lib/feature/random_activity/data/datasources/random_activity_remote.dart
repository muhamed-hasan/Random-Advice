import 'package:dio/dio.dart';
import 'package:random_activity/core/constants/constants.dart';
import 'package:random_activity/core/errors/exceptions.dart';
import 'package:random_activity/feature/random_activity/data/models/random_activity_model.dart';

// Get Data from remote server
abstract class RandomActivityRemoteDataSource {
  Future<RandomActivityModel>? getActivity();
}

class RandomActivityRemoteDataSourceImpl
    implements RandomActivityRemoteDataSource {
  final Dio dio;

  RandomActivityRemoteDataSourceImpl(this.dio);
  @override
  Future<RandomActivityModel>? getActivity() async {
    final response = await dio.get(Constants.baseUrl, queryParameters: {
      'api_key': Constants.apikey,
    });
    if (response.statusCode == 200) {
      return RandomActivityModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
