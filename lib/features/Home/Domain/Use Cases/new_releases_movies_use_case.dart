import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/Home/Domain/Contract%20Repo/home_contract_repo.dart';
import 'package:movies_app/features/Home/Domain/Entities/new_releases_movies_entity.dart';

@lazySingleton
class NewReleasesMoviesUseCase {
  final HomeContractRepo homeContractRepo;
  NewReleasesMoviesUseCase(this.homeContractRepo);
  Future<Either<Failure, List<NewReleasesMoviesEntity>>> call() =>
      homeContractRepo.getNewReleasesMovies();
}
