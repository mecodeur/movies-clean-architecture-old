import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_clean_architecture/core/utils/api_service.dart';
import 'package:movies_clean_architecture/movies/data/datasource/movie_remote_data_source.dart';

import '../../movies/data/repository/movies_repository.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<ApiService>(() {
      return ApiService(Dio());
    });

    sl.registerLazySingleton<MoviesRepository>(() {
      return MoviesRepository(MovieRemoteDataSource(sl.get<ApiService>()));
    });
  }
}