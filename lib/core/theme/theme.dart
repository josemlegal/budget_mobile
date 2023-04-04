import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF96D2DC);
  static const primaryLight = Color(0xFFCAE8ED);
  static const primaryDark = Color(0xFF6A9BA4);
  static const accent = Color(0xFF323C50);
  static const accentLight = Color(0xFF989DA7);
  static const accentDark = Color(0xFF11151E);
  static const warning = Color(0xFFFAC850);
  static const error = Color(0xFFFD5D5D);
  static const primaryTextColor = Color(0xFF092C4C);
  static const darkGrey = Color(0xFF7D7D96);
  static const grey = Color(0xFFB7BEC7);
  static const neutral = Color(0xFFD5D5E1);
  static const neutralLight = Color(0xFFF4F4F9);
  static const black = Color(0xFF000000);
}

const TextStyle headline9 = TextStyle(
  fontFamily: 'Campton',
  fontSize: 16,
  height: 1,
  fontWeight: FontWeight.w600,
  color: AppColors.black,
);

const TextStyle headline10 = TextStyle(
  fontFamily: 'Campton',
  fontSize: 14,
  height: 1,
  fontWeight: FontWeight.w600,
  color: AppColors.black,
);

class Themes {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.neutralLight,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
        primary: AppColors.primary, secondary: AppColors.accent),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: 'Campton',
        fontSize: 52,
        height: 1,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      headline2: TextStyle(
        fontFamily: 'Campton',
        fontSize: 46,
        height: 1,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      headline3: TextStyle(
        fontFamily: 'Campton',
        fontSize: 40,
        height: 1,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      headline4: TextStyle(
        fontFamily: 'Campton',
        fontSize: 32,
        height: 1.1,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      headline5: TextStyle(
        fontFamily: 'Campton',
        fontSize: 27,
        height: 0.9,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      headline6: TextStyle(
        fontFamily: 'Campton',
        fontSize: 24,
        height: 1,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Campton',
        fontSize: 20,
        height: 1,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      subtitle2: TextStyle(
        fontFamily: 'Campton',
        fontSize: 18,
        height: 1,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      bodyText1: TextStyle(
        fontFamily: 'NotoSans',
        fontSize: 18,
        height: 1,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
      ),
      bodyText2: TextStyle(
        fontFamily: 'NotoSans',
        fontSize: 16,
        height: 1.4,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
      ),
      caption: TextStyle(
        fontFamily: 'NotoSans',
        fontSize: 14,
        height: 1.4,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
      ),
      overline: TextStyle(
        fontFamily: 'NotoSans',
        fontSize: 12,
        height: 1.4,
        letterSpacing: 1.1,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
    ),
  );
}
