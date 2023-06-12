import 'package:movies_clean_architecture/core/utils/api_service.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_entity.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieEntity>> getNowPlayingMovies();

  Future<List<MovieEntity>> getPopularMovies();

  Future<List<MovieEntity>> getTopRatedMovies();
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  final ApiService apiService;

  MovieRemoteDataSource(this.apiService);

  @override
  Future<List<MovieEntity>> getNowPlayingMovies() async {
    var data = await apiService.get(
        endPoint:
            '/movie/now_playing?api_key=4d1044c950ee135ad26722c4bc2c90de');

    List<MovieEntity> movies = getMovies(data);

    return movies;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  List<MovieEntity> getMovies(Map<String, dynamic> data) {
    List<MovieEntity> movies = [];
    for (var movieMap in data['results']) {
      movies.addAll(movieMap);
    }
    return movies;
  }
}
