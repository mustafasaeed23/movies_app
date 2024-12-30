import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/Movies/Domain/Entities/movies_details_entity.dart';

abstract class MoviesDetailsContractRepo {
  Future<Either<Failure, MoviesDetailsEntity>> getMovie(movieId);
}
