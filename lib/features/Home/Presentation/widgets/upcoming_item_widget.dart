import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/theme/Colors.dart';
import 'package:movies_app/core/theme/styles.dart';
import 'package:movies_app/features/Home/Domain/Entities/new_releases_movies_entity.dart';
import 'package:movies_app/features/Movies/Presentation/screens/movies_details.dart';

class RecommendItemWidget extends StatefulWidget {
  final NewReleasesMoviesEntity entityItem;

  const RecommendItemWidget({super.key, required this.entityItem});

  @override
  State<RecommendItemWidget> createState() => _RecommendItemWidgetState();
}

class _RecommendItemWidgetState extends State<RecommendItemWidget> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = false; // Initialize it to false initially
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(MoviesDetails.routeName);
      },
      child: Card(
        color: AppColors.greyColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r)),
                  child: CachedNetworkImage(
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: widget.entityItem.posterUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const Center(
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
                        color: isSelected
                            ? AppColors.yellowColor
                            : AppColors.greyColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
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
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/star_icon.svg"),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "${widget.entityItem.popularity}",
                    style: Styles.style10.copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                widget.entityItem.title,
                style: Styles.style12Medium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.entityItem.releaseDate,
                style: Styles.style12MediumBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
