abstract class MoviesState {}

class MovieInitial extends MoviesState {}

class MovieSuccess extends MoviesState {}

class MovieLoaded extends MoviesState {}

class MoviesError extends MoviesState {
  final String message;
  MoviesError(this.message);
}
