import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/constents.dart';
import 'package:movies_app/core/error/expception.dart';
import 'package:movies_app/features/Movies/Data/Data%20Source/movies_data_source.dart';
import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/movies_details_model.dart';

@LazySingleton(as: MoviesDataSource)
class MoviesApiDataSource implements MoviesDataSource {
  final Dio _dio;

  MoviesApiDataSource(this._dio);

  @override
  Future<MoviesDetailsModel> getMovie(int movieId) async {
    try {
      final url = "https://api.themoviedb.org/3/movie/$movieId";
      final response = await _dio.get(
        url,
        options: Options(
          headers: {'Authorization': CasheConstents.bearerToken},
        ),
      );
      final movieResponse = MoviesDetailsModel.fromJson(response.data);
      return movieResponse;
    } catch (e) {
      throw RemoteException("Failed to get Movie Details");
    }
  }
}
