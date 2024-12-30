import 'package:flutter/material.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/features/Home/Presentation/screens/home_screen.dart';

class AppRouter {
  Widget generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return const HomeScreen();
      default:
        return Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
