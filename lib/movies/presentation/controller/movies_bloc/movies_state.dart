part of 'movies_bloc.dart';

class MoviesState extends Equatable {

  final List<MovieEntity> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMoviesErrorMessage;

  final List<MovieEntity> popularMovies;
  final RequestState popularMoviesState;
  final String popularMoviesErrorMessage;

  final List<MovieEntity> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesErrorMessage;

  MoviesState(
      {this.nowPlayingMovies : const [],
      this.nowPlayingMoviesState: RequestState.loading,
      this.nowPlayingMoviesErrorMessage: '',

      this.popularMovies: const [],
      this.popularMoviesState: RequestState.loading,
      this.popularMoviesErrorMessage: '',

      this.topRatedMovies: const [],
      this.topRatedMoviesState: RequestState.loading,
      this.topRatedMoviesErrorMessage: ''});

  MoviesState copyWith({
    List<MovieEntity>? nowPlayingMovies,
    RequestState? nowPlayingMoviesState,
    String? nowPlayingMoviesErrorMessage,
    List<MovieEntity>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMoviesErrorMessage,
    List<MovieEntity>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMoviesErrorMessage,
  }){
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesState: nowPlayingMoviesState?? this.nowPlayingMoviesState,
      nowPlayingMoviesErrorMessage: nowPlayingMoviesErrorMessage ?? this.nowPlayingMoviesErrorMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMoviesErrorMessage: popularMoviesErrorMessage ?? this.popularMoviesErrorMessage,
      topRatedMovies: topRatedMovies ??  this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMoviesErrorMessage: topRatedMoviesErrorMessage ?? this.topRatedMoviesErrorMessage,
    );
  }

  @override
  List<Object> get props =>
      [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMoviesErrorMessage,
        popularMovies,
        popularMoviesState,
        popularMoviesErrorMessage,
        topRatedMovies,
        topRatedMoviesState,
        topRatedMoviesErrorMessage,
      ];
}

/*
abstract class MoviesState extends Equatable {
  const MoviesState();

}

class MoviesInitial extends MoviesState {
  @override
  List<Object> get props => [];
}

class NowPlayingMoviesLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

class NowPlayingMoviesSuccess extends MoviesState {
  final List<MovieEntity> movies;

  NowPlayingMoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];

  NowPlayingMoviesSuccess copyWith(List<MovieEntity>? movies) {
    return NowPlayingMoviesSuccess(
      movies: movies ?? this.movies,
    );
  }

}

class NowPlayingMoviesFailed extends MoviesState {
  final String errMessage;

  NowPlayingMoviesFailed(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

// Popular Movies State

class PopularMoviesLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

class PopularMoviesSuccess extends MoviesState {
  final List<MovieEntity> movies;

  PopularMoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];

  PopularMoviesSuccess copyWith(List<MovieEntity>? movies) {
    return PopularMoviesSuccess(movies: movies ?? this.movies);
  }

}

class PopularMoviesFailed extends MoviesState {
  final String errMessage;

  PopularMoviesFailed(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

// Top Rated Movies State

class TopRatedMoviesLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

class TopRatedMoviesSuccess extends MoviesState {
  final List<MovieEntity> movies;

  TopRatedMoviesSuccess(this.movies);

  @override
  List<Object> get props => [movies];

}

class TopRatedMoviesFailed extends MoviesState {
  final String errMessage;

  TopRatedMoviesFailed(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}*/
