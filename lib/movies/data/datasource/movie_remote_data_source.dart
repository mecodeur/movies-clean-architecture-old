import 'package:movies_clean_architecture/core/utils/api_service.dart';
import 'package:movies_clean_architecture/movies/data/models/movie_model.dart';
import 'package:movies_clean_architecture/movies/data/models/recommendation_model.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_details_movie_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_recommendation_movies_usecase.dart';

import '../models/movie_details_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationParameters parameters);
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  final ApiService apiService;

  MovieRemoteDataSource(this.apiService);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var data = await apiService.get(endPoint: '/movie/now_playing');

    List<MovieModel> movies = getMovies(data);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    var data = await apiService.get(endPoint: '/movie/popular');

    List<MovieModel> movies = getMovies(data);

    return movies;
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var data = await apiService.get(endPoint: '/movie/top_rated');

    List<MovieModel> movies = getMovies(data);

    return movies;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async {
    var data = await apiService.get(endPoint: '/movie/${parameters.movieId}');

    MovieDetailsModel movie = MovieDetailsModel.fromJson(data);

    return movie;
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationParameters parameters) async{
    var data = await apiService.get(endPoint: '/movie/${parameters.id}/recommendations');

    List<RecommendationModel> movies = getMoviesRecom(data);

    return movies;
  }

  List<MovieModel> getMovies(Map<String, dynamic> data) {
    List<MovieModel> movies = [];
    for (var movieMap in data['results']) {
      movies.add(MovieModel.fromJson(movieMap));
    }
    return movies;
  }

  List<RecommendationModel> getMoviesRecom(Map<String, dynamic> data) {
    List<RecommendationModel> movies = [];

    for(var mapMovies in data['results']){
      movies.add(RecommendationModel.fromJson(mapMovies));
    }
    return movies;
  }

}
