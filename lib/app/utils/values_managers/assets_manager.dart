import 'package:flutter/material.dart';

abstract class LottieAssetsManager {
  static const String lightThemeSplashLogo =
      "assets/light_theme_newspaper.json";
  static const String darkThemeSplasLogo = "assets/dark_theme_newspaper.json";
}

abstract class ImagesManager {
  static const String fallbackImage = "assets/news-default-image@2x_0.png";
}

abstract class IconsManager {
  static const IconData cancelIcon = Icons.cancel_outlined;
  static const IconData searchIcon = Icons.search_outlined;
  static const IconData summerizeIcon = Icons.summarize_outlined;
  static const IconData arrowBack = Icons.arrow_back_ios_new;
  //? categories
  static const IconData business = Icons.business_outlined;
  static const IconData sports = Icons.sports_soccer_outlined;
  static const IconData science = Icons.science_outlined;
}
