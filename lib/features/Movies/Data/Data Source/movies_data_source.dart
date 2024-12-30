import 'package:movies_app/features/Movies/Data/Models/Movies%20Details%20Response/movies_details_model.dart';

abstract class MoviesDataSource {
  Future<MoviesDetailsModel> getMovie(int movieId);
}
