part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetailsEntity;
  final RequestState movieDetailState;
  final String movieDetailsMessageError;

  MovieDetailsState({
    this.movieDetailsEntity,
    this.movieDetailState = RequestState.loading,
    this.movieDetailsMessageError = '',
  });

  MovieDetailsState copyWith(
      {MovieDetailsEntity? movieDetailsEntity,
      RequestState? movieDetailState,
      String? movieDetailsMessageError}) {
    return MovieDetailsState(
      movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      movieDetailsMessageError:
          movieDetailsMessageError ?? this.movieDetailsMessageError,
    );
  }

  @override
  List<Object?> get props => [
        movieDetailsEntity,
        movieDetailState,
        movieDetailsMessageError,
      ];
}
