import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_top_rated_movies_usecase.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie_entity.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      emit(state.copyWith(nowPlayingMoviesState: RequestState.loading));

      final result = await getNowPlayingMoviesUseCase.execute();

      result.fold((failure) {
        return emit(state.copyWith(nowPlayingMoviesState: RequestState.failed, nowPlayingMoviesErrorMessage: failure.message));
      }, (movies) {
        return emit(state.copyWith(nowPlayingMoviesState: RequestState.success, nowPlayingMovies: movies));
      });
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      emit(state.copyWith(popularMoviesState: RequestState.loading));

      final result = await getPopularMoviesUseCase.execute();

      result.fold((failure) {
        return emit(state.copyWith(popularMoviesState: RequestState.failed, popularMoviesErrorMessage: failure.message));
      }, (movies) {
        return emit(state.copyWith(popularMoviesState: RequestState.success, popularMovies: movies));
      });
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      emit(MoviesState(topRatedMoviesState: RequestState.loading));

      final result = await getTopRatedMoviesUseCase.execute();

      result.fold((failure) {
        return emit(MoviesState(topRatedMoviesState: RequestState.failed, topRatedMoviesErrorMessage: failure.message));
      }, (movies) {
        return emit(MoviesState(topRatedMoviesState: RequestState.success, topRatedMovies: movies));
      });
    });
  }
}
