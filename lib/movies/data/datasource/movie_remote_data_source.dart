import 'package:movies_clean_architecture/core/utils/api_service.dart';
import 'package:movies_clean_architecture/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  final ApiService apiService;

  MovieRemoteDataSource(this.apiService);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var data = await apiService.get(
        endPoint:
            '/movie/now_playing');

    List<MovieModel> movies = getMovies(data);
    //print('>>>>>>>>>>>>>>>>>>> ${movies}');
    return movies;

  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    var data = await apiService.get(
        endPoint:
        '/movie/popular');

    List<MovieModel> movies = getMovies(data);

    return movies;
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    var data = await apiService.get(
        endPoint:
        '/movie/top_rated');

    List<MovieModel> movies = getMovies(data);

    return movies;
  }

  List<MovieModel> getMovies(Map<String, dynamic> data) {
    List<MovieModel> movies = [];
    for (var movieMap in data['results']) {
      movies.add(MovieModel.fromJson(movieMap));
    }
    return movies;
  }
}
