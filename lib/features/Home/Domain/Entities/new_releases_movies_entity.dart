class NewReleasesMoviesEntity {
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  final String backdropPath;
  final int id;
  final String title;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final bool video;
  final double voteAverage;

  NewReleasesMoviesEntity(
      {required this.backdropPath,
      required this.id,
      required this.title,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.video,
      required this.voteAverage});

  String get posterUrl => "$baseImageUrl$posterPath";

  String get backdropUrl => "$baseImageUrl$backdropPath";
}
