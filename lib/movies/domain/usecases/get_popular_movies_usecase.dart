import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/utils/base_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movies_clean_architecture/movies/domain/repository/base_movies_repository.dart';

import '../../../core/errors/failure.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<MovieEntity>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
