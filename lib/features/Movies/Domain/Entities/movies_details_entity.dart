import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/belongs_collection.dart';
import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/geners.dart';
import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/production_countries.dart';
import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/products_companies.dart';
import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/spoken_language.dart';

class MoviesDetailsEntity {
   final String backdropPath;
   final BelongsToCollection belongsToCollection;
   final int budget;
   final List<Genres> genres;
   final String homepage;
   final int id;
   final String imdbId;
   final String overview;
   final double popularity;
   final String posterPath;
   final List<ProductionCompanies> productionCompanies;
   final List<ProductionCountries> productionCountries;
   final String releaseDate;
   final int runtime;
   final List<SpokenLanguages> spokenLanguages;
   final String status;
   final String tagline;
   final String title;
   final bool video;
   final double voteAverage;
   final int voteCount;

  MoviesDetailsEntity({required this.backdropPath, required this.belongsToCollection, required this.budget, required this.genres, required this.homepage, required this.id, required this.imdbId, required this.overview, required this.popularity, required this.posterPath, required this.productionCompanies, required this.productionCountries, required this.releaseDate, required this.runtime, required this.spokenLanguages, required this.status, required this.tagline, required this.title, required this.video, required this.voteAverage, required this.voteCount});
}