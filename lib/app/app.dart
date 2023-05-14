import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/config/routes_manager.dart';
import 'package:news_app/app/utils/app_strings.dart';

import '../data/helpers/cache_helper.dart';
import 'utils/constants.dart';
import 'utils/decorations_and_themes.dart';
import '../view/cubit/cubit.dart';
import '../view/cubit/states.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getNewsOfCategory(categoryIndex: Screens.business.index)
        ..getNewsOfCategory(categoryIndex: Screens.sport.index)
        ..getNewsOfCategory(categoryIndex: Screens.science.index)
        ..toggleModeIcon(fromSharedPreferences: CacheHelper.getDarkMode),
      child: BlocConsumer<NewsCubit, AppState>(
        listener: (BuildContext context, AppState state) {},
        builder: (BuildContext context, AppState state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appTitle,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: context.read<NewsCubit>().appThemeMode,
            onGenerateRoute: RouteGenerator.getRoute,
          );
        },
      ),
    );
  }
}