import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/core/utils/api_service.dart';
import 'package:movies_clean_architecture/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_clean_architecture/movies/data/repository/movies_repository.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_movies_usecase.dart';

import '../../../domain/entities/movie_entity.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      emit(NowPlayingMoviesLoading());

      ApiService apiService = ApiService(Dio());
      MovieRemoteDataSource movieRemoteDataSource = MovieRemoteDataSource(apiService);
      MoviesRepository baseMoviesRepository = MoviesRepository(movieRemoteDataSource);

      print('State1 ====== ${state}');
      final result = await GetNowPlayingMoviesUseCase(baseMoviesRepository).execute();

      result.fold((failure) {
        return emit(NowPlayingMoviesFailed(failure.message));
      }, (movies) {
        return emit(NowPlayingMoviesSuccess(movies));
      });

      print('State2 ====== ${state}');
    });
  }
}
