import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:movies_clean_architecture/core/utils/base_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_clean_architecture/movies/domain/repository/base_movies_repository.dart';

class GetDetailsMovieUseCase
    extends BaseUseCase<MovieDetailsEntity, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetDetailsMovieUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getDetailsMovie(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
