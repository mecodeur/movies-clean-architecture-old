import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:movies_clean_architecture/movies/domain/repository/base_movies_repository.dart';

import '../entities/movie_entity.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<MovieEntity>>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
