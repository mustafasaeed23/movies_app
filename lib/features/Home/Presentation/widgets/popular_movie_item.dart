import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/theme/Colors.dart';
import 'package:movies_app/core/theme/styles.dart';
import 'package:movies_app/features/Home/Domain/Entities/popular_movies_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/features/Movies/Presentation/screens/movies_details.dart';

class PopularMovieItem extends StatefulWidget {
  const PopularMovieItem(this.movieItem, {super.key});

  final PopularMoviesEntity movieItem;

  @override
  _PopularMovieItemState createState() => _PopularMovieItemState();
}

class _PopularMovieItemState extends State<PopularMovieItem> {
  bool isSelected = false; // Track selection state for the bookmark icon

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(MoviesDetails.routeName);
      },
      child: SizedBox(
        height: 290.h,
        width: 420.w,
        child: Stack(
          children: [
            // the video backdrop
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.movieItem.backdropUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const Center(
                      child: CircularProgressIndicator(
                color: AppColors.yellowColor,
                strokeWidth: 2,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned(
              top: 85.h,
              left: 1.w,
              child: SizedBox(
                width: 130.w,
                height: 200.h,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.movieItem.posterUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const Center(
                          child: CircularProgressIndicator(
                    color: AppColors.yellowColor,
                    strokeWidth: 2,
                  )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              top: 80.h,
              left: 0,
              right: 0,
              child: Container(
                width: 60.w,
                height: 60.h,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow_sharp,
                  size: 55.sp,
                ),
              ),
            ),
            Positioned(
              top: 260.h,
              left: 170.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movieItem.title,
                    style: Styles.style14,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    widget.movieItem.releaseDate,
                    style: Styles.style10,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 85.h,
              left: 1.w,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/bookmark.png",
                    width: 27.w,
                    height: 36.h,
                    fit: BoxFit.cover,
                    color: isSelected
                        ? AppColors.yellowColor
                        : AppColors.greyColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected; // Toggle selection state
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(
                        isSelected ? Icons.check : Icons.add,
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
  }
}
