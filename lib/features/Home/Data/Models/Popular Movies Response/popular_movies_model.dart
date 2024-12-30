import 'package:movies_app/features/Home/Domain/Entities/popular_movies_entity.dart';

class PopularMoviesModel extends PopularMoviesEntity {
  PopularMoviesModel({
    required this.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required this.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required this.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;
  final String? originalLanguage;
  final double? popularity;
  final double? voteAverage;
  final int? voteCount;

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) {
    return PopularMoviesModel(
      adult: json["adult"] as bool?,
      backdropPath: json["backdrop_path"] as String,
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"].map((x) => x as int)),
      id: json["id"] as int,
      originalLanguage: json["original_language"] as String?,
      originalTitle: json["original_title"] as String,
      overview: json["overview"] as String,
      popularity: (json["popularity"] as num).toDouble(),
      posterPath: json["poster_path"] as String,
      releaseDate:
          json["release_date"] as String, 
      title: json["title"] as String,
      video: json["video"] as bool,
      voteAverage: (json["vote_average"] as num?)?.toDouble(),
      voteCount: json["vote_count"] as int?,
    );
  }
}
