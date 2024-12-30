import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/core/widgets/loading_indicator.dart';
import 'package:movies_app/features/Home/Presentation/widgets/Popular_movie_item.dart';
import 'package:movies_app/features/Home/cubit/home_cubit.dart';
import 'package:movies_app/features/Home/cubit/home_state.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context); // Use the existing Cubit

    return SizedBox(
      height: 330.h,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is PopularMoviesLoaded) {
            return const LoadingIndicator();
          } else if (state is PopularMoviesSuccess) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(5.h),
              itemCount: state.popularmovieslist.length,
              itemBuilder: (context, index) =>
                  PopularMovieItem(state.popularmovieslist[index]),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10.w,
                );
              },
            );
          } else if (state is PopularMoviesError) {
            return Text(state.message);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
