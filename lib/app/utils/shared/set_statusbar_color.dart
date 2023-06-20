import 'dart:async';

import 'package:flutter/services.dart';
import 'package:news_app/app/utils/values_managers/constants.dart';

import '../../../data/helpers/cache_helper.dart';
import '../values_managers/colors_manager.dart';

Color _getModeColor({required Color orange}) {
  return CacheHelper.getDarkMode == null
      ? orange
      : (CacheHelper.getDarkMode!)
          ? ColorsManager.darkModeColor
          : orange;
}

void setStatusbarColor() {
  Timer(
      const Duration(
          milliseconds: Constants.milliSecondsBeforeChangingStatusbarColor),
      () {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: _getModeColor(orange: ColorsManager.orangeShade800),
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor:
              _getModeColor(orange: ColorsManager.orangeShade800),
          systemNavigationBarIconBrightness: Brightness.light),
    );
  });
}
