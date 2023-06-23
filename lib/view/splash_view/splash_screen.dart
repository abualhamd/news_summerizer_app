import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/app/utils/values_managers/assets_manager.dart';

import '../../app/config/routes_manager.dart';
import '../../app/utils/values_managers/colors_manager.dart';
import '../../data/helpers/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (CacheHelper.getDarkMode ?? false)
          ? ColorsManager.darkModeColor
          : ColorsManager.orangeShade800,
      body: Center(
        child: Lottie.asset(LottieAssetsManager.darkThemeSplasLogo,
            controller: _animationController, onLoaded: (composition) {
          _animationController
            ..duration = composition.duration
            ..forward().whenComplete(
                () => Navigator.pushReplacementNamed(context, Routes.homeRoute));
        }),
      ),
    );
  }
}
