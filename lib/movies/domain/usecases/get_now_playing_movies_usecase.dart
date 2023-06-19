import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:movies_clean_architecture/core/utils/base_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/repository/base_movies_repository.dart';

import '../entities/movie_entity.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<MovieEntity>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
