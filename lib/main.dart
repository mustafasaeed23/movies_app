import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/app_bloc_observer.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/movies_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const MoviesApp());
}
