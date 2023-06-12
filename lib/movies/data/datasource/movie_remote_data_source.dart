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
            '/movie/now_playing');

    List<MovieEntity> movies = getMovies(data);

    return movies;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() async{
    var data = await apiService.get(
        endPoint:
        '/movie/popular');

    List<MovieEntity> movies = getMovies(data);

    return movies;
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies() async{
    var data = await apiService.get(
        endPoint:
        '/movie/top_rated');

    List<MovieEntity> movies = getMovies(data);

    return movies;
  }

  List<MovieEntity> getMovies(Map<String, dynamic> data) {
    List<MovieEntity> movies = [];
    for (var movieMap in data['results']) {
      movies.addAll(movieMap);
    }
    return movies;
  }
}
