import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/theme/Colors.dart';

class NavBarIcon extends StatelessWidget {
  final String imagePath;
  final bool isSelected;

  const NavBarIcon(
      {super.key, required this.imagePath, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(4),
        child: SvgPicture.asset(
          imagePath,
          color: isSelected ? AppColors.mainColor : AppColors.whiteColor,
        ));
  }
}
