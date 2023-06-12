import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movies_clean_architecture/movies/domain/repository/base_movies_repository.dart';

import '../../../core/errors/failure.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<MovieEntity>>> execute() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
