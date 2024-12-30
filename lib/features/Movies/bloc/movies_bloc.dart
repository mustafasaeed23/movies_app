import 'package:bloc/bloc.dart';
import 'package:movies_app/features/Movies/bloc/movies_event.dart';
import 'package:movies_app/features/Movies/bloc/movies_state.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MovieInitial()) {
    on<MoviesEvent>((event, emit) {
    });
  }
}
