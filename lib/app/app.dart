import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/helpers/cache_helper.dart';
import 'utils/constants.dart';
import 'utils/decorations_and_themes.dart';
import '../view/cubit/cubit.dart';
import '../view/cubit/states.dart';
import '../view/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: context.read<NewsCubit>().appThemeMode,
            home: Home(),
          );
        },
      ),
    );
  }
}