import 'package:flutter/material.dart';
import 'package:news_app/view/article_view/article_screen.dart';
import 'package:news_app/view/home_view/home_screen.dart';
import 'package:news_app/view/search_view/search_screen.dart';
import 'package:news_app/view/splash_view/splash_screen.dart';

import '../utils/values_managers/app_strings.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homeRoute = '/homeRoute';
  static const String searchRoute = '/searchRoute';
  static const String articleRoute = '/articleRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Routes.articleRoute:
        return MaterialPageRoute(builder: (_) => const ArticleScreen());
      default:
        return _unDefinedRoute();
    }
  }

  static Route<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.undefinedRoute)),
        body: const Center(child: Text(AppStrings.undefinedRoute)),
      ),
    );
  }
}
