import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/helpers/dio_helper.dart';
import 'package:news_app/shared/decorations_and_themes.dart';
import 'helpers/cache_helper.dart';
import 'shared/constants.dart';
import 'screens/home_screen.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await CacheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

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
