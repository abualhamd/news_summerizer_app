import 'package:flutter/material.dart';

abstract class ImagesManager {
  static const String fallbackImage = "assets/news-default-image@2x_0.png";
}

abstract class IconsManager {
  static const IconData cancelIcon = Icons.cancel_outlined;
  static const IconData searchIcon = Icons.search_outlined;
  static const IconData summerizeIcon = Icons.summarize_outlined;
}
