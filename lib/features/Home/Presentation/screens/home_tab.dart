import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/Home/Presentation/widgets/recommendation_section.dart';

import '../../../../core/di/service_locator.dart';
import '../../cubit/home_cubit.dart';
import '../widgets/popular_section.dart';
import '../widgets/upcoming_section.dart';
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<HomeCubit>()
        ..getPopularMovies()
        ..getRecommendedMovies()
        ..getNewReleasesMovies(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15.h),
                const PopularSection(),
                SizedBox(height: 15.h),
                const NewReleasesSection(),
                SizedBox(height: 15.h),
                const RecommedendSection(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
