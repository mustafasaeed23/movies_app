import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/expception.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/Home/Data/Data%20Source/home_remote_data_source.dart';
import 'package:movies_app/features/Home/Domain/Contract%20Repo/home_contract_repo.dart';
import 'package:movies_app/features/Home/Domain/Entities/new_releases_movies_entity.dart';
import 'package:movies_app/features/Home/Domain/Entities/popular_movies_entity.dart';
import 'package:movies_app/features/Home/Domain/Entities/recommended_movies_entity.dart';

@LazySingleton(as: HomeContractRepo)
class HomeImplyRepo implements HomeContractRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  HomeImplyRepo(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, List<PopularMoviesEntity>>> getPopularMovies() async {
    try {
      final responsePopularMovies =
          await _homeRemoteDataSource.getPopularMoveis();
      return Right(responsePopularMovies.results);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<NewReleasesMoviesEntity>>>
      getNewReleasesMovies() async {
    try {
      final responseNewReleasesMovies =
          await _homeRemoteDataSource.getNewReleasesMovies();
      return Right(responseNewReleasesMovies.results!);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<RecommendedMoviesEntity>>>
      getRecommendedMovies() async {
    try {
      final response = await _homeRemoteDataSource.getRecommendedMovies();
      return Right(response.results);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
