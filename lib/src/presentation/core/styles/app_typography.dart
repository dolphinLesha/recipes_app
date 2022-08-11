import 'package:flutter/material.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';

typedef AT = AppTypography;

class AppTypography {
  /// font families
  static const boldFontFamily = 'Montserrat-Bold';
  static const semiBoldFontFamily = 'Montserrat-SemiBold';
  static const mediumFontFamily = 'Montserrat-Medium';
  static const regularFontFamily = 'Montserrat-Regular';

  /// headers
  static const TextStyle h1 = TextStyle(
    fontFamily: boldFontFamily,
    fontSize: 36,
    color: AdditionalColors.dark,
  );
  static const TextStyle h2 = TextStyle(
    fontFamily: boldFontFamily,
    fontSize: 24,
    color: AdditionalColors.dark,
  );
  static const TextStyle h3 = TextStyle(
    fontFamily: semiBoldFontFamily,
    fontSize: 18,
    color: AdditionalColors.dark,
  );
  static const TextStyle h4 = TextStyle(
    fontFamily: semiBoldFontFamily,
    fontSize: 16,
    color: AdditionalColors.dark,
  );
  static const TextStyle h5 = TextStyle(
    fontFamily: semiBoldFontFamily,
    fontSize: 14,
    color: AdditionalColors.dark,
  );

  /// buttons
  static const TextStyle button = TextStyle(
    fontFamily: mediumFontFamily,
    fontSize: 16,
    color: AdditionalColors.dark,
  );

  /// bodies
  static const TextStyle body1 = TextStyle(
    fontFamily: regularFontFamily,
    fontSize: 18,
    color: AdditionalColors.dark,
  );
  static const TextStyle body2 = TextStyle(
    fontFamily: regularFontFamily,
    fontSize: 16,
    color: AdditionalColors.dark,
  );
  static const TextStyle body3 = TextStyle(
    fontFamily: regularFontFamily,
    fontSize: 14,
    color: AdditionalColors.dark,
  );
  static const TextStyle body4 = TextStyle(
    fontFamily: regularFontFamily,
    fontSize: 12,
    color: AdditionalColors.dark,
  );

  ///captions
  static const TextStyle caption = TextStyle(
    fontFamily: regularFontFamily,
    fontSize: 11,
    color: AdditionalColors.dark,
  );
}
