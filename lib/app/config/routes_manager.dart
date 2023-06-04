import 'package:flutter/material.dart';
import 'package:news_app/view/article/article_screen.dart';
import 'package:news_app/view/home/home_screen.dart';
import 'package:news_app/view/search/search_screen.dart';

import '../utils/values_managers/app_strings.dart';

class Routes {
  static const String homeRoute = '/';
  static const String searchRoute = '/searchRoute';
  static const String articleRoute = '/articleRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const Home());
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
