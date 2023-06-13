import 'package:movies_clean_architecture/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieModel(
      id: jsonData['id'],
      title: jsonData['title'],
      backdropPath: jsonData['poster_path'],
      genreIds: List<int>.from(jsonData['genre_ids'].map((e) => e)),
      overview: jsonData['overview'],
      voteAverage: jsonData['vote_average'].toDouble(),
      releaseDate: jsonData['release_date'],
    );
  }
}
