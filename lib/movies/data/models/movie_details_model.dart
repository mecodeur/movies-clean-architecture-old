import 'package:movies_clean_architecture/movies/domain/entities/movie_details_entity.dart';

import 'genres_model.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'],
      genres: List<GenresModel>.from(
          json['genres'].map((e) => GenresModel.fromJson(e))),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['original_title'],
      voteAverage: json['vote_average'],
    );
  }
}
