import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/expception.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/Movies/Data/Data%20Source/movies_data_source.dart';
import 'package:movies_app/features/Movies/Domain/Contract%20Repo/movies_details_contract_repo.dart';
import 'package:movies_app/features/Movies/Domain/Entities/movies_details_entity.dart';

@LazySingleton(as: MoviesDetailsContractRepo)
class MoviesDetailsImplyRepo implements MoviesDetailsContractRepo {
  final MoviesDataSource _moviesDataSource;
  MoviesDetailsImplyRepo(this._moviesDataSource);
  @override
  Future<Either<Failure, MoviesDetailsEntity>> getMovie(movieId) async {
    try {
      final response = await _moviesDataSource.getMovie(movieId);
      return Right(response);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
