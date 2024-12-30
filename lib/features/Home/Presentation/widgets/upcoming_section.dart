import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/core/theme/Colors.dart';
import 'package:movies_app/core/theme/styles.dart';
import 'package:movies_app/core/widgets/loading_indicator.dart';
import 'package:movies_app/features/Home/Presentation/widgets/upcoming_item_widget.dart';
import 'package:movies_app/features/Home/cubit/home_cubit.dart';
import 'package:movies_app/features/Home/cubit/home_state.dart';

class RecommedendSection extends StatelessWidget {
  const RecommedendSection({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context); // Use the existing Cubit
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10),
        width: double.infinity,
        // height: 190.h,
        color: AppColors.greyColor.withOpacity(0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              "New Releases",
              style: Styles.style15.copyWith(color: AppColors.whiteColor),
            ),
            SizedBox(
              height: 12.h,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is NewReleasesMoviesLoaded) {
                  return const LoadingIndicator();
                } else if (state is NewReleasesMoviesSuccess) {
                  return CarouselSlider.builder(
                    itemCount: state.newReleasesMoviesmovieslist.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return RecommendItemWidget(
                          entityItem: state.newReleasesMoviesmovieslist[index]);
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 12 / 8,
                      viewportFraction: 0.35,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                } else if (state is NewReleasesMoviesError) {
                  return Text(state.message);
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      );

  }
}
