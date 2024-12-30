import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/belongs_collection.dart';
import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/geners.dart';
import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/production_countries.dart';
import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/products_companies.dart';
import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/spoken_language.dart';
import 'package:movies_app/features/Movies/Domain/Entities/movies_details_entity.dart';

class MoviesDetailsModel extends MoviesDetailsEntity {
  MoviesDetailsModel({
    required this.adult,
    required super.backdropPath,
    required super.belongsToCollection,
    required super.budget,
    required super.genres,
    required super.homepage,
    required super.id,
    required super.imdbId,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.productionCompanies,
    required super.productionCountries,
    required super.releaseDate,
    required super.status,
    required super.runtime,
    required super.spokenLanguages,
    required super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.revenue,
  });

  final bool? adult;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final int? revenue;

  // Factory constructor to create an instance from JSON
  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) {
    return MoviesDetailsModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String,
      belongsToCollection: BelongsToCollection.fromJson(
          json['belongs_to_collection'] as Map<String, dynamic>),
      budget: json['budget'] as int,
      genres: (json['genres'] as List)
          .map((x) => Genres.fromJson(x as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String,
      id: json['id'] as int,
      imdbId: json['imdb_id'] as String,
      originCountry: json['origin_country'] != null
          ? List<String>.from(json['origin_country'] as List)
          : null,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      productionCompanies: (json['production_companies'] as List)
          .map((x) => ProductionCompanies.fromJson(x as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List)
          .map((x) => ProductionCountries.fromJson(x as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] as String,
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int,
      spokenLanguages: (json['spoken_languages'] as List)
          .map((x) => SpokenLanguages.fromJson(x as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );
  }
}
