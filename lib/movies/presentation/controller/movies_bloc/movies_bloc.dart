import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_movies_usecase.dart';

import '../../../domain/entities/movie_entity.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(MoviesInitial()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      emit(NowPlayingMoviesLoading());

     /* ApiService apiService = ApiService(Dio());
      MovieRemoteDataSource movieRemoteDataSource = MovieRemoteDataSource(apiService);
      MoviesRepository baseMoviesRepository = MoviesRepository(movieRemoteDataSource);*/

      final result = await getNowPlayingMoviesUseCase.execute();
      print('My Result ====== ${result}');

      result.fold((failure) {
        return emit(NowPlayingMoviesFailed(failure.message));
      }, (movies) {
        return emit(NowPlayingMoviesSuccess(movies));
      });

      //print('State2 ====== ${state}');
    });
  }
}
