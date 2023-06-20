part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  GetMovieDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final int id;

  GetMovieRecommendationEvent(this.id);

  @override
  List<Object> get props => [id];
}
