import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/theme/Colors.dart';
import 'package:movies_app/core/theme/styles.dart';

class SimliarMoviesWidget extends StatefulWidget {
  const SimliarMoviesWidget({super.key});

  @override
  State<SimliarMoviesWidget> createState() => _SimliarMoviesWidgetState();
}

class _SimliarMoviesWidgetState extends State<SimliarMoviesWidget> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = false; // Initialize it to false initially
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.all(10.sp),
      width: double.infinity,
      color: Colors.black54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Text(
            "More Like This",
            style: Styles.style15,
          ),
          SizedBox(
            height: 10.h,
          ),
          CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (_, context, __) {
                return Card(
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
                              child: Image.asset(
                                "assets/images/film_cover_photo.png",
                                width: double.infinity,
                                height: 180.h,
                                fit: BoxFit.cover,
                              )
                              // CachedNetworkImage(
                              //   height: 180.h,
                              //   width: double.infinity,
                              //   fit: BoxFit.cover,
                              //   imageUrl: "assets/images/film_cover_photo.png",
                              //   progressIndicatorBuilder:
                              //       (context, url, downloadProgress) =>
                              //           const Center(
                              //               child: CircularProgressIndicator(
                              //     color: AppColors.yellowColor,
                              //     strokeWidth: 2,
                              //   )),
                              //   errorWidget: (context, url, error) =>
                              //       const Icon(Icons.error),
                              // ),
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
                              "7.7",
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
                          "entityItem.title",
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
                          "2024",
                          style: Styles.style12MediumBlack,
                        ),
                      ),
                    ],
                  ),
                );
              },
              options:
                  CarouselOptions(viewportFraction: 0.35, aspectRatio: 12 / 8))
        ],
      ),
    );
  }
}
