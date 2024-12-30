import 'package:movies_app/features/Home/Data/Models/New%20Releases%20Response/new_releases_response.dart';
import 'package:movies_app/features/Home/Data/Models/Popular%20Movies%20Response/popular_movies_response.dart';
import 'package:movies_app/features/Home/Data/Models/Recommended%20Response/reommended_movies_response.dart';

abstract class HomeRemoteDataSource {
  Future<PopularMoviesResponse> getPopularMoveis();
  Future<NewReleasesResponse> getNewReleasesMovies();
  Future<RecomendedMoviesResponse> getRecommendedMovies();
}
