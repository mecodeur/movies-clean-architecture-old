import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_clean_architecture/core/utils/api_service.dart';
import 'package:movies_clean_architecture/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/repository/movies_repository.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_movies_usecase.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        home: Container(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getDataMovies();
  }

  void getDataMovies() async {
    ApiService apiService = ApiService(Dio());
    MovieRemoteDataSource movieRemoteDataSource =
        MovieRemoteDataSource(apiService);
    MoviesRepository moviesRepository = MoviesRepository(movieRemoteDataSource);
    final result = await GetNowPlayingMoviesUseCase(moviesRepository).execute();
    print('Result >>>>>>>>>>> : ${result.toString()}');
  }
}
