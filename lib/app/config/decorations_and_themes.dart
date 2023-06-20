import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app/utils/values_managers/colors_manager.dart';
import '../utils/values_managers/constants.dart';

final ThemeData lightTheme = ThemeData(
  primarySwatch: ColorsManager.orangeMaterialColor,
  scaffoldBackgroundColor: ColorsManager.white,
  //? appbar
  appBarTheme: AppBarTheme(
    titleSpacing: Constants.horizontalPaddingValue,
    backgroundColor: ColorsManager.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: ColorsManager.darkModeColor,
      fontWeight: FontWeight.bold,
      fontSize: 25.0.sp,
    ),
    actionsIconTheme: const IconThemeData(
      color: ColorsManager.black,
    ),
  ),
  //? bottom navigation bar
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: ColorsManager.orangeColor,
    elevation: 20.0.w,
  ),
  //? floating action button
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorsManager.orangeShade800,
    foregroundColor: ColorsManager.white,
  ),
  //? textfield
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20.r)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color:
                ColorsManager.orangeShade800), //ColorsManager.lightBlueAccent),
        borderRadius: BorderRadius.circular(20.r)),
    filled: true,
    hoverColor: Colors.lightBlueAccent,
    fillColor: Colors.grey[200],
    prefixIconColor: Colors.grey[400],
    //TODO prefixIconColor: ,
    labelStyle: TextStyle(color: Colors.grey[600]),
  ),
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: ColorsManager.darkModeColor,
  //? appbar
  appBarTheme: AppBarTheme(
    titleSpacing: Constants.horizontalPaddingValue,
    backgroundColor: ColorsManager.darkModeColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: ColorsManager.white,
      fontWeight: FontWeight.bold,
      fontSize: 25.0.sp,
    ),
    actionsIconTheme: const IconThemeData(
      color: ColorsManager.white,
    ),
  ),
  //? bottomNavigationBar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorsManager.darkModeColor,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: ColorsManager.blue,
    unselectedItemColor: ColorsManager.white,
    elevation: 20.0,
  ),
  //? floatingActionButton
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: ColorsManager.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: ColorsManager.white),
    bodyMedium: TextStyle(color: ColorsManager.white),
  ),
  //? textfield
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20.r)),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorsManager.lightBlueAccent),
      borderRadius: BorderRadius.circular(20.r),
    ),
    filled: true,
    hoverColor: Colors.lightBlueAccent,
    fillColor: ColorsManager.white,
    prefixIconColor: Colors.grey[400],
    //TODO prefixIconColor: ,
    labelStyle: TextStyle(color: Colors.grey[500]),
    floatingLabelStyle: TextStyle(color: Colors.grey[400])
  ),
);
