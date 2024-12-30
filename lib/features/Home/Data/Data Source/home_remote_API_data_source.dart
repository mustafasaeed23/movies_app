import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/constents.dart';
import 'package:movies_app/core/error/expception.dart';
import 'package:movies_app/features/Home/Data/Data%20Source/home_remote_data_source.dart';
import 'package:movies_app/features/Home/Data/Models/New%20Releases%20Response/new_releases_response.dart';
import 'package:movies_app/features/Home/Data/Models/Popular%20Movies%20Response/popular_movies_response.dart';
import 'package:movies_app/features/Home/Data/Models/Recommended%20Response/reommended_movies_response.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteApiDataSource implements HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteApiDataSource(this._dio);

  @override
  Future<PopularMoviesResponse> getPopularMoveis() async {
    try {
      final response = await _dio.get(
        APIConstents.popularEndPoint,
        options: Options(
          headers: {'Authorization': CasheConstents.bearerToken},
        ),
      );
      final popularMoviesResponse =
          PopularMoviesResponse.fromJson(response.data);
      return popularMoviesResponse;
    } catch (e) {
      print('Error fetching movies: $e');
      throw RemoteException("Failed to get Movies");
    }
  }

  @override
  Future<NewReleasesResponse> getNewReleasesMovies() async {
    try {
      final response = await _dio.get(
        APIConstents.newReleasesEndPoint,
        options: Options(
          headers: {'Authorization': CasheConstents.bearerToken},
        ),
      );

      final newReleasesResponse = NewReleasesResponse.fromJson(response.data);
      return newReleasesResponse;
    } catch (e) {
      throw throw RemoteException("Failed to get Movies");
    }
  }

  @override
  Future<RecomendedMoviesResponse> getRecommendedMovies() async {
    try {
      final resonse = await _dio.get(
        APIConstents.recommendedEndPoint,
        options: Options(
          headers: {'Authorization': CasheConstents.bearerToken},
        ),
      );
      final recommendedResponse =
          RecomendedMoviesResponse.fromJson(resonse.data);
      return recommendedResponse;
    } catch (e) {
      print('Error fetching movies: $e');

      throw throw RemoteException("Failed to get Movies");
    }
  }
}
