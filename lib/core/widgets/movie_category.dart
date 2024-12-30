import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/theme/Colors.dart';
import 'package:movies_app/core/theme/styles.dart';

class MovieCategoryBox extends StatelessWidget {
  const MovieCategoryBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 25.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.greyColor, style: BorderStyle.solid, width: 2),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(
        child: Text(
          "Action",
          style: Styles.style10,
        ),
      ),
    );
  }
}
