import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_details_movie_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();

  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetailsEntity>> getDetailsMovie(MovieDetailsParameters parameters);
}
