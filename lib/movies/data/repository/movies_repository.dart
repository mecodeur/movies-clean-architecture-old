import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:movies_clean_architecture/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movies_clean_architecture/movies/domain/entities/recommendation_entity.dart';
import 'package:movies_clean_architecture/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_details_movie_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_recommendation_movies_usecase.dart';

class MoviesRepository implements BaseMoviesRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MoviesRepository(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    try {
      final List<MovieEntity> movies =
          await movieRemoteDataSource.getNowPlayingMovies();

      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    try {
      final List<MovieEntity> movies =
          await movieRemoteDataSource.getPopularMovies();
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    try {
      final List<MovieEntity> movies =
          await movieRemoteDataSource.getTopRatedMovies();
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getDetailsMovie(
      MovieDetailsParameters parameters) async {
    try {
      final MovieDetailsEntity movie =
          await movieRemoteDataSource.getMovieDetails(parameters);
      return right(movie);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendationMovies(
      RecommendationParameters parameters) async {
    try {
      final List<RecommendationEntity> movies =
          await movieRemoteDataSource.getRecommendationMovies(parameters);
      return right(movies);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
