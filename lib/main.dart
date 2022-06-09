import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/themes.dart';
import 'screens/home.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()), blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> NewsCubit(),
      child: BlocConsumer<NewsCubit, AppState>(
        listener: (BuildContext context, AppState state){},
        builder: (BuildContext context, AppState state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: context.read<NewsCubit>().modeIcon==Icons.light_mode_outlined?ThemeMode.dark:ThemeMode.light,
            home: Home(),
          );
        },
      ),
    );
  }
}
