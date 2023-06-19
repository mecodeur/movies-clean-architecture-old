import 'package:movies_clean_architecture/movies/domain/entities/genres.dart';

class GenresModel extends GenresEntity {
  GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
