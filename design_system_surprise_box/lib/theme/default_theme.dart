import 'package:design_system_surprise_box/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';

class ThemeDefault {
  static ThemeData getTheme(BuildContext context) => ThemeData(
      primaryColor: AppColors.primary,
      colorScheme:const  ColorScheme(primary: AppColors.primary, 
      primaryVariant: AppColors.primary, 
      secondary: AppColors.primary, 
      secondaryVariant: AppColors.primary, 
      surface: AppColors.primary, 
      background: AppColors.primary, 
      error: AppColors.error, 
      onPrimary: AppColors.white, 
      onSecondary: AppColors.primary, 
      onSurface: AppColors.primary, 
      onBackground: AppColors.primary, 
      onError: AppColors.primary, 
      brightness: Brightness.light),
      scaffoldBackgroundColor: AppColors.white,
      primaryColorLight: AppColors.white,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: AppColors.accent,
      ),
      
      textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme).copyWith(
        subtitle1: const TextStyle(
          color: AppColors.black
        ),
        subtitle2: const TextStyle(
          color: AppColors.black
        ),
        headline1: const TextStyle(
          color: AppColors.black
        ),
        headline2: const TextStyle(
          color: AppColors.black
        ),
        headline3: const TextStyle(
          color: AppColors.black
        ),
        headline4: const TextStyle(
          color:AppColors.black
        ),
        headline5: const TextStyle(
          color: AppColors.black
        ),
        headline6: const TextStyle(
          color: AppColors.white
        ),
        caption: const TextStyle(
          color: AppColors.black
        ),
        bodyText1: const TextStyle(
          color:AppColors.black
        ),
        bodyText2: const TextStyle(
          color: AppColors.black
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60)
        )
      )
      );
}
