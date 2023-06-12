import 'package:movies_clean_architecture/movies/domain/entities/movie_entity.dart';

abstract class BaseMoviesRepository {
  Future<List<MovieEntity>> getNowPlayingMovies();

  Future<List<MovieEntity>> getPopularMovies();

  Future<List<MovieEntity>> getTopRatedMovies();
}
