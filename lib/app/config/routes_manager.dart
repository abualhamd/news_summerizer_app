import 'package:flutter/material.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:news_app/view/search_screen.dart';

import '../utils/app_strings.dart';

class Routes {
  static const String homeRoute = '/';
  static const String searchRoute = '/searchRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) => const Home());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
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
