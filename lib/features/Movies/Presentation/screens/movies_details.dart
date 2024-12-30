import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/theme/Colors.dart';
import 'package:movies_app/core/theme/styles.dart';
import 'package:movies_app/core/widgets/movie_category.dart';
import 'package:movies_app/core/widgets/poster_widget.dart';
import 'package:movies_app/core/widgets/simliar_movies_widget.dart';
import 'package:movies_app/core/widgets/video_player_widget.dart';
import 'package:movies_app/features/Home/Presentation/screens/home_screen.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({super.key});
  static const String routeName = '/movies_details';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
          leading: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                child: SvgPicture.asset("assets/icons/arrow-back.svg")),
          ),
          title: Text(
            "Dora and the lost city of gold",
            style: Styles.style20,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              // the video
              const VideoPlayerWidget(),
              SizedBox(
                height: 12.h,
              ),

              /// the title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Dora and the lost city of gold",
                  style: Styles.style18,
                ),
              ),

              /// release
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 15.h),
                child: Text(
                  "2019  PG-13  2h 7m",
                  style: Styles.style10,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.h),
                child: Row(
                  children: [
                    const PosterWidget(),
                    SizedBox(
                      width: 17.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MovieCategoryBox(),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          "Having spent most of her life\nexploring  the jungle, nothing could\nprepare Dora for her most\ndangerous adventure\nyet — high school. ",
                          style: Styles.style14,
                          maxLines: 5,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/star_icon.svg",
                              fit: BoxFit.fill,
                              width: 20.w,
                              height: 20.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                "7.7",
                                style: Styles.style15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0.h),
                child: const SimliarMoviesWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
