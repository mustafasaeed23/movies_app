import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/Home/Domain/Contract%20Repo/home_contract_repo.dart';
import 'package:movies_app/features/Home/Domain/Entities/popular_movies_entity.dart';

@lazySingleton
class GetPopularMoviesUseCase {
  final HomeContractRepo homeContractRepo;
  GetPopularMoviesUseCase(this.homeContractRepo);
  Future<Either<Failure, List<PopularMoviesEntity>>> call() =>
      homeContractRepo.getPopularMovies();
}
