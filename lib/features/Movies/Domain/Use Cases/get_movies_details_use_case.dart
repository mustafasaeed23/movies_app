import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/Movies/Domain/Contract%20Repo/movies_details_contract_repo.dart';
import 'package:movies_app/features/Movies/Domain/Entities/movies_details_entity.dart';

class GetMoviesDetailsUseCase {
  final MoviesDetailsContractRepo moviesDetailsContractRepo;
  GetMoviesDetailsUseCase(this.moviesDetailsContractRepo);

  Future<Either<Failure, MoviesDetailsEntity>> call(int movieId) async =>
      await moviesDetailsContractRepo.getMovie(movieId);
}
