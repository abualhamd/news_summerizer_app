import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/helpers/cache_helper.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/sport_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import '../shared/constants.dart';
import '../helpers/dio_helper.dart';

//TODO split into NewsCubit and AppCubit; the AppCubit containing the toggleDarkMode
class NewsCubit extends Cubit<AppState> {
  NewsCubit() : super(AppInitState());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = Screens.business.index;
  IconData modeIcon = Icons.light_mode_outlined;
  ThemeMode appThemeMode = ThemeMode.light;

  final List<String> _labels = [
    'business',
    'sport',
    'science',
  ];

  final List<Widget> screens = [
    Business(),
    Sport(),
    Science(),
  ];

  late List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(
        icon: const Icon(Icons.business_outlined),
        label: _labels[Screens.business.index]),
    BottomNavigationBarItem(
        icon: const Icon(Icons.sports_soccer_outlined),
        label: _labels[Screens.sport.index]),
    BottomNavigationBarItem(
        icon: const Icon(Icons.science_outlined),
        label: _labels[Screens.science.index]),
  ];

  void changeScreenIndex(int index) {
    currentIndex = index;
    emit(AppChangeScreenIndexState());
  }

  void toggleModeIcon({bool? fromSharedPreferences}) {
    if(fromSharedPreferences == null){
      if (modeIcon == Icons.dark_mode_outlined) {
        CacheHelper.setDarkMode(isDark: true);
        modeIcon = Icons.light_mode_outlined;
        appThemeMode = ThemeMode.dark;
      } else {
        CacheHelper.setDarkMode(isDark: false);
        modeIcon = Icons.dark_mode_outlined;
        appThemeMode = ThemeMode.light;
      }
    }
    else{
      modeIcon = fromSharedPreferences?Icons.light_mode_outlined:Icons.dark_mode_outlined;
      appThemeMode = fromSharedPreferences?ThemeMode.dark:ThemeMode.light;
    }
    emit(AppToggleModeIThemeState());
  }

  final List<List<dynamic>> categories = [
    [],
    [],
    [],
    []
  ];

  void getNewsOfCategory({required int categoryIndex}) {
    emit(AppGetCategoryNewsLoadingState());
    DioHelper.getDataOfCategory(category: {
      'category': _labels[categoryIndex],
    }).then((value) {
      categories[categoryIndex] = value.data['articles'];
      emit(AppGetCategoryNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetCategoryNewsErrorState());
    });
  }

  void getNewsOfSearch({required String query}) {
    emit(AppGetSearchLoadingState());
    DioHelper.getDataOfSearch(query: query).then((value) {
      categories[Screens.search.index] = value.data['articles'];
      emit(AppGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetSearchErrorState());
    });
  }

// void statusBarColor() => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//   statusBarColor: Colors.white,
// ));
}
