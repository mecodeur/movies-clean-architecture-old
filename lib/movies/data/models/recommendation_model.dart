import 'package:movies_clean_architecture/movies/domain/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  RecommendationModel({
     super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      backdropPath: json['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
      id: json['id'],
    );
  }
}
