part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetails;
  final RequestState movieDetailState;
  final String movieDetailsMessageError;

  final List<RecommendationEntity>? movieRecommendation;
  final RequestState movieRecommendationState;
  final String movieRecommendationMessageError;

  MovieDetailsState({
    this.movieDetails,
    this.movieDetailState = RequestState.loading,
    this.movieDetailsMessageError = '',
    this.movieRecommendation,
    this.movieRecommendationState = RequestState.loading,
    this.movieRecommendationMessageError = '',
  });

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetailsEntity,
    RequestState? movieDetailState,
    String? movieDetailsMessageError,
    List<RecommendationEntity>? movieRecommendation,
    RequestState? movieRecommendationState,
    String? movieRecommendationMessageError,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetailsEntity ?? this.movieDetails,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      movieDetailsMessageError:
          movieDetailsMessageError ?? this.movieDetailsMessageError,
      movieRecommendation: movieRecommendation ?? this.movieRecommendation,
      movieRecommendationState:
          movieRecommendationState ?? this.movieRecommendationState,
      movieRecommendationMessageError: movieRecommendationMessageError ??
          this.movieRecommendationMessageError,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailState,
        movieDetailsMessageError,
        movieRecommendation,
        movieRecommendationState,
        movieRecommendationMessageError,
      ];
}
