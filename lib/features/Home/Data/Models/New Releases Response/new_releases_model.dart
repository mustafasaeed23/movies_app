import 'package:movies_app/features/Home/Domain/Entities/new_releases_movies_entity.dart';

class NewReleasesMovies extends NewReleasesMoviesEntity {
  bool? adult;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  int? voteCount;

  NewReleasesMovies(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.video,
      required super.voteAverage,
      required this.adult,
      required this.genreIds,
      required this.originalLanguage,
      required this.originalTitle,
      required this.voteCount});

  factory NewReleasesMovies.fromJson(Map<String, dynamic> json) {
    return NewReleasesMovies(
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
      releaseDate: json["release_date"] as String,
      title: json["title"] as String,
      video: json["video"] as bool,
      voteAverage: (json["vote_average"] as num).toDouble(),
      voteCount: json["vote_count"] as int?,
    );
  }
}
