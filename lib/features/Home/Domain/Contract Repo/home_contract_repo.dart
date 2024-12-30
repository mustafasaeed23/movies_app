import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/features/Home/Domain/Entities/new_releases_movies_entity.dart';

import 'package:movies_app/features/Home/Domain/Entities/popular_movies_entity.dart';
import 'package:movies_app/features/Home/Domain/Entities/recommended_movies_entity.dart';

abstract class HomeContractRepo {
  Future<Either<Failure, List<PopularMoviesEntity>>> getPopularMovies();

  Future<Either<Failure, List<NewReleasesMoviesEntity>>> getNewReleasesMovies();

  Future<Either<Failure, List<RecommendedMoviesEntity>>> getRecommendedMovies();
}
