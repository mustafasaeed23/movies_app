import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/core/theme/Colors.dart';
import 'package:movies_app/core/theme/styles.dart';
import 'package:movies_app/core/widgets/loading_indicator.dart';
import 'package:movies_app/features/Home/cubit/home_cubit.dart';
import 'package:movies_app/features/Home/cubit/home_state.dart';
import 'package:movies_app/features/Movies/Presentation/screens/movies_details.dart';

class NewReleasesSection extends StatefulWidget {
  const NewReleasesSection({super.key});

  @override
  State<NewReleasesSection> createState() => _NewReleasesSectionState();
}

class _NewReleasesSectionState extends State<NewReleasesSection> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = [];
  }

  void initializeSelection(int count) {
    if (isSelected.length != count) {
      isSelected = List<bool>.filled(count, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context); // Use the existing Cubit

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      width: double.infinity,
      color: AppColors.greyColor.withOpacity(0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Text(
            "Recommended",
            style: Styles.style15.copyWith(color: AppColors.whiteColor),
          ),
          SizedBox(height: 12.h),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is RecommendedMoviesLoaded) {
                return const LoadingIndicator();
              } else if (state is RecommendedMoviesSuccess) {
                // Ensure isSelected matches the length of movies
                initializeSelection(state.recommendedMoviesList.length);

                return CarouselSlider.builder(
                  itemCount: state.recommendedMoviesList.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(MoviesDetails.routeName);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0.r),
                              child: CachedNetworkImage(
                                width: 110.w,
                                fit: BoxFit.cover,
                                imageUrl: state
                                    .recommendedMoviesList[index].posterUrl,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        const Center(
                                            child: CircularProgressIndicator(
                                  color: AppColors.yellowColor,
                                  strokeWidth: 2,
                                )),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Positioned(
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/bookmark.png",
                                    width: 27.w,
                                    height: 36.h,
                                    fit: BoxFit.cover,
                                    color: isSelected[index]
                                        ? AppColors.yellowColor
                                        : AppColors.greyColor,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelected[index] =
                                            !isSelected[index];
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(
                                        isSelected[index]
                                            ? Icons.check
                                            : Icons.add,
                                        color: AppColors.whiteColor,
                                        size: 24.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 12 / 5,
                    viewportFraction: 0.35,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              } else if (state is RecommendedMoviesErorr) {
                return Text(
                  state.message,
                  style: Styles.style14.copyWith(color: Colors.red),
                );
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
