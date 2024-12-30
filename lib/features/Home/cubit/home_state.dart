import 'package:movies_app/features/Home/Domain/Entities/new_releases_movies_entity.dart';
import 'package:movies_app/features/Home/Domain/Entities/popular_movies_entity.dart';
import 'package:movies_app/features/Home/Domain/Entities/recommended_movies_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

/// Popular Movies States
class PopularMoviesLoaded extends HomeState {}

class PopularMoviesSuccess extends HomeState {
  final List<PopularMoviesEntity> popularmovieslist;
  PopularMoviesSuccess(this.popularmovieslist);
}

class PopularMoviesError extends HomeState {
  final String message;
  PopularMoviesError(this.message);
}

/// New Releases Movies
class NewReleasesMoviesLoaded extends HomeState {}

class NewReleasesMoviesSuccess extends HomeState {
  final List<NewReleasesMoviesEntity> newReleasesMoviesmovieslist;
  NewReleasesMoviesSuccess(this.newReleasesMoviesmovieslist);
}

class NewReleasesMoviesError extends HomeState {
  final String message;
  NewReleasesMoviesError(this.message);
}

/// Recommended Movies
class RecommendedMoviesLoaded extends HomeState {}

class RecommendedMoviesSuccess extends HomeState {
  final List<RecommendedMoviesEntity> recommendedMoviesList;
  RecommendedMoviesSuccess(this.recommendedMoviesList);
}

class RecommendedMoviesErorr extends HomeState {
  final String message;
  RecommendedMoviesErorr(this.message);
}
