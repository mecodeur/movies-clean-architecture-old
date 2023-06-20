part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetails;
  final RequestState movieDetailState;
  final String movieDetailsMessageError;

  MovieDetailsState({
    this.movieDetails,
    this.movieDetailState = RequestState.loading,
    this.movieDetailsMessageError = '',
  });

  MovieDetailsState copyWith(
      {MovieDetailsEntity? movieDetailsEntity,
      RequestState? movieDetailState,
      String? movieDetailsMessageError}) {
    return MovieDetailsState(
      movieDetails: movieDetailsEntity ?? this.movieDetails,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      movieDetailsMessageError:
          movieDetailsMessageError ?? this.movieDetailsMessageError,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailState,
        movieDetailsMessageError,
      ];
}
