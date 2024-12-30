// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies_app/core/di/register_module.dart' as _i114;
import 'package:movies_app/features/Home/cubit/home_cubit.dart' as _i707;
import 'package:movies_app/features/Home/Data/Data%20Source/home_remote_API_data_source.dart'
    as _i692;
import 'package:movies_app/features/Home/Data/Data%20Source/home_remote_data_source.dart'
    as _i262;
import 'package:movies_app/features/Home/Data/Imply%20Repo/home_imply_repo.dart'
    as _i1025;
import 'package:movies_app/features/Home/Domain/Contract%20Repo/home_contract_repo.dart'
    as _i105;
import 'package:movies_app/features/Home/Domain/Use%20Cases/get_popular_movies_use_case.dart'
    as _i686;
import 'package:movies_app/features/Home/Domain/Use%20Cases/new_releases_movies_use_case.dart'
    as _i242;
import 'package:movies_app/features/Home/Domain/Use%20Cases/recommend_movies_use_case.dart'
    as _i439;
import 'package:movies_app/features/Movies/Data/Data%20Source/movies_API_data_source.dart'
    as _i532;
import 'package:movies_app/features/Movies/Data/Data%20Source/movies_data_source.dart'
    as _i715;
import 'package:movies_app/features/Movies/Data/Imply%20Repo/movies_details_imply_repo.dart'
    as _i805;
import 'package:movies_app/features/Movies/Domain/Contract%20Repo/movies_details_contract_repo.dart'
    as _i130;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i262.HomeRemoteDataSource>(
        () => _i692.HomeRemoteApiDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i715.MoviesDataSource>(
        () => _i532.MoviesApiDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i130.MoviesDetailsContractRepo>(
        () => _i805.MoviesDetailsImplyRepo(gh<_i715.MoviesDataSource>()));
    gh.lazySingleton<_i105.HomeContractRepo>(
        () => _i1025.HomeImplyRepo(gh<_i262.HomeRemoteDataSource>()));
    gh.lazySingleton<_i686.GetPopularMoviesUseCase>(
        () => _i686.GetPopularMoviesUseCase(gh<_i105.HomeContractRepo>()));
    gh.lazySingleton<_i242.NewReleasesMoviesUseCase>(
        () => _i242.NewReleasesMoviesUseCase(gh<_i105.HomeContractRepo>()));
    gh.lazySingleton<_i439.RecommendMoviesUseCase>(
        () => _i439.RecommendMoviesUseCase(gh<_i105.HomeContractRepo>()));
    gh.lazySingleton<_i707.HomeCubit>(() => _i707.HomeCubit(
          gh<_i686.GetPopularMoviesUseCase>(),
          gh<_i242.NewReleasesMoviesUseCase>(),
          gh<_i439.RecommendMoviesUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i114.RegisterModule {}
