import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/screens/business.dart';
import 'package:news_app/screens/sport.dart';
import 'package:news_app/screens/science.dart';
import '../constants.dart';
import '../dio_helper.dart';

class NewsCubit extends Cubit<AppState> {
  NewsCubit() : super(AppInitState());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = Screens.business.index;
  IconData modeIcon = Icons.dark_mode_outlined;
  ThemeMode appThemeMode = ThemeMode.light;

  final List<String> _labels = [
    'Business',
    'Sport',
    'Science',
  ];

  final List<Widget> screens = [
    Business(),
    Sport(),
    Science(),
  ];

  //TODO
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

  void toggleModeIcon() {
    if (modeIcon == Icons.dark_mode_outlined) {
      modeIcon = Icons.light_mode_outlined;
      appThemeMode = ThemeMode.dark;
    } else {
      modeIcon = Icons.dark_mode_outlined;
      appThemeMode = ThemeMode.light;
    }

    emit(AppToggleModeIThemeState());
  }

  final List<List<dynamic>> categories = [
    [],
    [],
    [],
  ];

  void getNewsOfCategory({required int categoryIndex}) {
    emit(AppGetCategoryNewsLoadingState());
    DioHelper.getData(category: {
      'category': _labels[categoryIndex].toLowerCase(),
    }).then((value) {
      categories[categoryIndex] = value.data['articles'];
      emit(AppGetCategoryNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetCategoryNewsErrorState());
    });
  }

// void statusBarColor() => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//   statusBarColor: Colors.white,
// ));
}
