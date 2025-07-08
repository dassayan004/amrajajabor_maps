import 'package:flutter/material.dart';
import 'package:amrajajabor_maps/app/constants/image_strings.dart';
import 'package:amrajajabor_maps/app/helpers/helper_functions.dart';

class AppLogo extends StatelessWidget {
  final double height;
  final double? width;

  const AppLogo({super.key, this.height = 100, this.width});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final logoPath = isDark ? TImages.lightAppLogo : TImages.darkAppLogo;

    return Image.asset(
      logoPath,
      height: height,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
