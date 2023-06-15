part of 'movies_bloc.dart';

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

  NowPlayingMoviesSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class NowPlayingMoviesFailed extends MoviesState {
  final String errMessage;

  NowPlayingMoviesFailed(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
