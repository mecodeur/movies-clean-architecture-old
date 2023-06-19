import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:movies_clean_architecture/core/utils/base_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_clean_architecture/movies/domain/repository/base_movies_repository.dart';

class GetDetailsMovieUseCase
    extends BaseUseCase<MovieDetailsEntity, DetailsMovieParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetDetailsMovieUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
      DetailsMovieParameters parameters) async {
    return await baseMoviesRepository.getDetailsMovie(parameters.movieId);
  }
}

class DetailsMovieParameters extends Equatable {
  final int movieId;

  DetailsMovieParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
