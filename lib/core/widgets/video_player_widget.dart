import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/theme/Colors.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/film_image.png"),
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
      ],
    );
  }
}