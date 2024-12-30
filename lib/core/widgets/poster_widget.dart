import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/theme/Colors.dart';

class PosterWidget extends StatefulWidget {
  const PosterWidget({super.key});

  @override
  State<PosterWidget> createState() => _PosterWidgetState();
}

class _PosterWidgetState extends State<PosterWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/Poster_Image.png"),
        Positioned(
          top: 1.h,
          left: 1.w,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/bookmark.png",
                width: 27.w,
                height: 36.h,
                fit: BoxFit.cover,
                color: isSelected ? AppColors.yellowColor : AppColors.greyColor,
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
    );
  }
}
