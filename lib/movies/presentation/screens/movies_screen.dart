import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_bloc/movies_bloc.dart';

import '../../../core/utils/api_service.dart';
import '../../../core/utils/service_locator.dart';
import '../../data/datasource/movie_remote_data_source.dart';
import '../../data/repository/movies_repository.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ApiService apiService = ApiService(Dio());
    MovieRemoteDataSource movieRemoteDataSource = MovieRemoteDataSource(apiService);
    MoviesRepository baseMoviesRepository = MoviesRepository(movieRemoteDataSource);

    print('1 - movieRemoteDataSource ====== ${movieRemoteDataSource.hashCode}');
    print('1 - baseMoviesRepository ====== ${baseMoviesRepository.hashCode}');

    return BlocProvider(
      create: (context) => MoviesBloc(GetNowPlayingMoviesUseCase(sl.get<MoviesRepository>()))..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return Scaffold();
        },
      ),
    );
  }
}
