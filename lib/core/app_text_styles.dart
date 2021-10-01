import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {

  static final TextStyle splashTitle = GoogleFonts.pollerOne(
    color: Colors.white,
    fontSize: 80,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic
  );

  static final TextStyle starTitle = GoogleFonts.pollerOne(
    color: AppColors.primaryColorDark,
    fontSize: 80,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle title = GoogleFonts.robotoMono(
    color: AppColors.primaryTextColor,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle titleBold = GoogleFonts.robotoMono(
    color: AppColors.primaryTextColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading = GoogleFonts.robotoMono(
    color: AppColors.primaryColorDark,
    fontSize: 40,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle headingMedium = GoogleFonts.robotoMono(
    color: AppColors.primaryColorDark,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body = GoogleFonts.robotoMono(
    color: AppColors.primaryTextColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyBold = GoogleFonts.robotoMono(
    color: AppColors.primaryTextColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bodyLight = GoogleFonts.robotoMono(
    color: AppColors.secondaryTextColor,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

}
