import 'package:movies_app/features/Home/Data/Models/Popular%20Movies%20Response/popular_movies_model.dart';

class PopularMoviesResponse {
  PopularMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int? page;
  final List<PopularMoviesModel> results;
  final int? totalPages;
  final int? totalResults;

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) {
    return PopularMoviesResponse(
      page: json["page"] as int?,
      results: json["results"] == null
          ? []
          : List<PopularMoviesModel>.from(
              json["results"].map((x) => PopularMoviesModel.fromJson(x))),
      totalPages: json["total_pages"] as int?,
      totalResults: json["total_results"] as int?,
    );
  }
}
