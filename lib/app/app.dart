import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/config/routes_manager.dart';
import 'package:news_app/app/utils/values_managers/app_strings.dart';
import 'package:news_app/app/utils/enums.dart';
import 'package:news_app/app/utils/shared/set_statusbar_color.dart';

import '../data/helpers/cache_helper.dart';
import 'config/decorations_and_themes.dart';
import '../view/cubit/cubit.dart';
import '../view/cubit/states.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getNewsOfCategory(category: Categories.business)
        ..getNewsOfCategory(category: Categories.sport)
        ..getNewsOfCategory(category: Categories.science)
        ..toggleModeIcon(fromSharedPreferences: CacheHelper.getDarkMode)
            .then((value) => null),
      child: BlocConsumer<NewsCubit, AppState>(
        listener: (BuildContext context, AppState state) {
          if (state is AppToggleModeIThemeState) {
            setStatusbarColor();
          }
        },
        builder: (BuildContext context, AppState state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appTitle,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: context.watch<NewsCubit>().appThemeMode,
            onGenerateRoute: RouteGenerator.getRoute,
          );
        },
      ),
    );
  }
}
