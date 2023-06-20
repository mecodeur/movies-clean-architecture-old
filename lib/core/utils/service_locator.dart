import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_clean_architecture/core/utils/api_service.dart';
import 'package:movies_clean_architecture/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_details_movie_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_bloc/movies_bloc.dart';

import '../../movies/data/repository/movies_repository.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // API SERVICE
    sl.registerLazySingleton<ApiService>(() {
      return ApiService(Dio());
    });

    // REPOSITORY
    sl.registerLazySingleton<MoviesRepository>(() {
      return MoviesRepository(MovieRemoteDataSource(sl.get<ApiService>()));
    });

    // USE CASES
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(() {
      return GetNowPlayingMoviesUseCase(sl.get<MoviesRepository>());
    });
    sl.registerLazySingleton<GetPopularMoviesUseCase>(() {
      return GetPopularMoviesUseCase(sl.get<MoviesRepository>());
    });
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(() {
      return GetTopRatedMoviesUseCase(sl.get<MoviesRepository>());
    });

    sl.registerLazySingleton<GetDetailsMovieUseCase>(() {
      return GetDetailsMovieUseCase(sl.get<MoviesRepository>());
    });
    sl.registerLazySingleton<GetRecommendationMoviesUseCase>(() {
      return GetRecommendationMoviesUseCase(sl.get<MoviesRepository>());
    });

    // BLOC
    sl.registerLazySingleton(() {
      return MoviesBloc(
        sl.get<GetNowPlayingMoviesUseCase>(),
        sl.get<GetPopularMoviesUseCase>(),
        sl.get<GetTopRatedMoviesUseCase>(),
      );
    });

    sl.registerLazySingleton(() {
      return MovieDetailsBloc(
        sl.get<GetDetailsMovieUseCase>(),
        sl.get<GetRecommendationMoviesUseCase>(),
      );
    });
  }
}
