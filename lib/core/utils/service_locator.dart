import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_clean_architecture/core/utils/api_service.dart';
import 'package:movies_clean_architecture/movies/data/datasource/movie_remote_data_source.dart';

import '../../movies/data/repository/movies_repository.dart';

final sl = GetIt.instance;

class ServiceLocator{

  void init() {
    sl.registerSingleton<ApiService>(
      ApiService(
        Dio(),
      ),
    );
    sl.registerSingleton<MoviesRepository>(
      MoviesRepository(MovieRemoteDataSource(sl.get<ApiService>(),)),
    );

    // API SERVICE
    //sl.registerSingleton<ApiService>(ApiService(Dio()));

    // DATA SOURCE
    //sl.registerSingleton<BaseMovieRemoteDataSource>(MovieRemoteDataSource(sl()));

    // REPOSITORY
    //sl.registerSingleton<BaseMoviesRepository>(MoviesRepository(sl()));

    // Use cases
    //sl.registerSingleton(GetNowPlayingMoviesUseCase(sl()));

  }
}

