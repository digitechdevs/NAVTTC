import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import '../utils/app_size.dart';

class AppTextStyles {
  static TextStyle headerTextStyle = GoogleFonts.inter(
    fontSize: AppSize.headSize,
    color: AppColors.primaryBlack,
    fontWeight: FontWeight.normal,
  );

  static TextStyle headerTextBoldStyle(
      {double? textSize, Color? primaryWhite, FontWeight? textFont}) {
    return GoogleFonts.inter(
        color: primaryWhite ?? AppColors.primaryBlack,
        fontSize: AppSize.headSize,
        fontWeight: textFont ?? FontWeight.bold);
  }

  static TextStyle primaryColorBasicTextStyle = GoogleFonts.inter(
    fontSize: AppSize.headSize,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle simpleBlackTextStyle(
      {double? textSize, Color? primaryWhite, FontWeight? fontWeight}) {
    return GoogleFonts.inter(
        color: primaryWhite ?? AppColors.primaryBlack,
        fontSize: textSize ?? AppSize.textSize,
        fontWeight: fontWeight ?? FontWeight.normal);
  }

  static TextStyle simpleBlackBoldTextStyle = GoogleFonts.inter(
    fontSize: AppSize.textSize,
    color: AppColors.primaryBlack,
    fontWeight: FontWeight.bold,
  );

  static TextStyle simpleWhiteTextStyle = GoogleFonts.inter(
    fontSize: AppSize.textSize,
    color: AppColors.primaryWhite,
    fontWeight: FontWeight.normal,
  );

  static TextStyle simpleGreyTextStyle = GoogleFonts.inter(
    fontSize: AppSize.textSize,
    color: AppColors.borderGrey,
    fontWeight: FontWeight.normal,
  );

  static TextStyle middleLightBlackTextStyle = GoogleFonts.inter(
    fontSize: AppSize.middleSize,
    color: AppColors.subtitle,
  );

  static TextStyle middleBlackTextStyle = GoogleFonts.inter(
    fontSize: AppSize.middleSize,
    color: AppColors.primaryBlack,
  );

  static TextStyle middleBlackBoldTextStyle = GoogleFonts.inter(
    fontSize: AppSize.middleSize,
    color: AppColors.primaryBlack,
    fontWeight: FontWeight.bold,
  );

  static TextStyle middleGreyBoldTextStyle = GoogleFonts.inter(
    fontSize: AppSize.middleSize,
    color: AppColors.borderGrey,
    fontWeight: FontWeight.bold,
  );

  static TextStyle middleWhiteBoldTextStyle = GoogleFonts.inter(
    fontSize: AppSize.middleSize,
    color: AppColors.primaryWhite,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headBlackBoldTextStyle = GoogleFonts.inter(
    fontSize: AppSize.headSize,
    color: AppColors.primaryBlack,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headWhiteBoldTextStyle = GoogleFonts.inter(
    fontSize: AppSize.headSize3,
    color: AppColors.primaryWhite,
    fontWeight: FontWeight.bold,
  );

  static TextStyle middleGreyTextStyle = GoogleFonts.inter(
    fontSize: AppSize.textSize,
    color: AppColors.borderGrey,
    fontWeight: FontWeight.w500,
  );

  static TextStyle followButtonTextStyle = GoogleFonts.inter(
    fontSize: AppSize.buttonTextSize,
    color: AppColors.primaryBlack,
    fontWeight: FontWeight.normal,
  );

  static TextStyle unFollowButtonTextStyle = GoogleFonts.inter(
    fontSize: AppSize.buttonTextSize,
    color: AppColors.primaryBlack,
    fontWeight: FontWeight.normal,
  );

  static TextStyle skipButtonTextStyle = GoogleFonts.inter(
    fontSize: AppSize.buttonTextSize,
    color: AppColors.primaryBlack,
    fontWeight: FontWeight.bold,
  );
}
