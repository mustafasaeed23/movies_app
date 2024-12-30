import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/Home/Domain/Use%20Cases/get_popular_movies_use_case.dart';
import 'package:movies_app/features/Home/Domain/Use%20Cases/new_releases_movies_use_case.dart';
import 'package:movies_app/features/Home/Domain/Use%20Cases/recommend_movies_use_case.dart';
import 'package:movies_app/features/Home/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.getPopularMoviesUseCase,
    this.newReleasesMoviesUseCase,
    this.recommendMoviesUseCase,
  ) : super(HomeInitial());

  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final NewReleasesMoviesUseCase newReleasesMoviesUseCase;
  final RecommendMoviesUseCase recommendMoviesUseCase;

  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoaded());
    final result = await getPopularMoviesUseCase.call();
    result.fold((failure) {
      emit(PopularMoviesError(failure.message));
      print(failure.message);
    }, (movies) {
      emit(PopularMoviesSuccess(movies));
      print("Okaaaaaaay");
    });
  }

  Future<void> getNewReleasesMovies() async {
    emit(NewReleasesMoviesLoaded());
    final result = await newReleasesMoviesUseCase.call();
    result.fold((failure) {
      emit(NewReleasesMoviesError(failure.message));
      print(failure.message);
    }, (movies) {
      emit(NewReleasesMoviesSuccess(movies));
      print("Okaaaaay");
    });
  }

  Future<void> getRecommendedMovies() async {
    emit(RecommendedMoviesLoaded());
    final result = await recommendMoviesUseCase.call();
    result.fold((failure) {
      emit(RecommendedMoviesErorr(failure.message));
      print(failure.message);
    }, (movies) {
      emit(RecommendedMoviesSuccess(movies));
      print("Okaaaaay");
    });
  }
}
