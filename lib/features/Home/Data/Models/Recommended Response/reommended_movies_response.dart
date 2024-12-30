import 'package:movies_app/features/Home/Data/Models/Recommended%20Response/recommended_movies_model.dart';

class RecomendedMoviesResponse {
    RecomendedMoviesResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    final int? page;
    final List<RecommendedMoviesModel> results;
    final int? totalPages;
    final int? totalResults;

    factory RecomendedMoviesResponse.fromJson(Map<String, dynamic> json){ 
        return RecomendedMoviesResponse(
            page: json["page"],
            results: json["results"] == null ? [] : List<RecommendedMoviesModel>.from(json["results"].map((x) => RecommendedMoviesModel.fromJson(x))),
            totalPages: json["total_pages"],
            totalResults: json["total_results"],
        );
    }

}

