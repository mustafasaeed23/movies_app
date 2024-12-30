import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/theme/Colors.dart';
import 'package:movies_app/features/Home/Presentation/screens/home_screen.dart';
import 'package:movies_app/features/Movies/Presentation/screens/movies_details.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        designSize: const Size(430, 932),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Movies App",
          // onGenerateRoute: generate.AppRouter(),
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            MoviesDetails.routeName:(context)=> const MoviesDetails(),
          },
          initialRoute: HomeScreen.routeName,
          theme: AppColors.defaultTheme,
        ));
  }
}
