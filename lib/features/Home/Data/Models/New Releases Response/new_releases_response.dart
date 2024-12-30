import 'package:movies_app/features/Home/Data/Models/New%20Releases%20Response/new_releases_model.dart';

class NewReleasesResponse {
  Dates? dates;
  int? page;
  List<NewReleasesMovies>? results;
  int? totalPages;
  int? totalResults;

  NewReleasesResponse(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  NewReleasesResponse.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <NewReleasesMovies>[];
      json['results'].forEach((v) {
        results!.add(new NewReleasesMovies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}
