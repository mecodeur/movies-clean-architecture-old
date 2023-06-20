import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie_details_entity.dart';
import '../../../domain/entities/recommendation_entity.dart';
import '../../../domain/usecases/get_details_movie_usecase.dart';
import '../../../domain/usecases/get_recommendation_movies_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetDetailsMovieUseCase getDetailsMovieUseCase;
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;

  MovieDetailsBloc(
      this.getDetailsMovieUseCase, this.getRecommendationMoviesUseCase)
      : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getDetailsMovieUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold((failure) {
      return emit(state.copyWith(
          movieDetailState: RequestState.loading,
          movieDetailsMessageError: failure.message));
    }, (movie) {
      return emit(state.copyWith(
          movieDetailState: RequestState.success, movieDetailsEntity: movie));
    });
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationMoviesUseCase(
        RecommendationParameters(id: event.id));

    result.fold((failure) {
      return emit(state.copyWith(
          movieRecommendationState: RequestState.loading,
          movieRecommendationMessageError: failure.message));
    }, (movies) {
      return emit(state.copyWith(
          movieRecommendationState: RequestState.success,
          movieRecommendation: movies));
    });
  }
}
