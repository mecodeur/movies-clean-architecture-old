import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_clean_architecture/core/errors/failure.dart';
import 'package:movies_clean_architecture/core/utils/base_use_case.dart';
import 'package:movies_clean_architecture/movies/domain/entities/recommendation_entity.dart';
import 'package:movies_clean_architecture/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationMoviesUseCase
    extends BaseUseCase<List<RecommendationEntity>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<RecommendationEntity>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendationMovies(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}
