class PopularMoviesEntity {
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;

  PopularMoviesEntity({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
  });

  String get posterUrl => "$baseImageUrl$posterPath";

  String get backdropUrl => "$baseImageUrl$backdropPath";
}
