import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/utils/extensions/get_category_icon_extension.dart';
import 'package:news_app/app/utils/extensions/get_category_label_extension.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/view/cubit/states.dart';
import '../../app/utils/enums.dart';
import '../../data/helpers/cache_helper.dart';
import '../../data/helpers/dio_helper.dart';
import '../home/components/news_category_widget.dart';

//TODO split into NewsCubit and AppCubit; the AppCubit containing the toggleDarkMode
class NewsCubit extends Cubit<AppState> {
  NewsCubit() : super(AppInitState());

  // int currentIndex = Screens.business.index;
  Categories currentCategory = Categories.business;
  IconData modeIcon = Icons.light_mode_outlined;
  ThemeMode appThemeMode = ThemeMode.light;

  final List<Widget> screens = const [
    NewsCategoryComponent(category: Categories.business),
    NewsCategoryComponent(category: Categories.sport),
    NewsCategoryComponent(category: Categories.science),
  ];

  late List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(
        icon: Icon(Categories.business.getIcon()),
        label: Categories.business.getLabel()),
    BottomNavigationBarItem(
      icon: Icon(Categories.sport.getIcon()),
      label: Categories.sport.getLabel(),
    ),
    BottomNavigationBarItem(
      icon: Icon(Categories.science.getIcon()),
      label: Categories.science.getLabel(),
    )
  ];

  void changeScreenIndex({required Categories category}) {
    currentCategory = category;
    emit(AppChangeScreenIndexState());
  }

  Future<void> toggleModeIcon({bool? fromSharedPreferences}) async {
    if (fromSharedPreferences == null) {
      if (modeIcon == Icons.dark_mode_outlined) {
        await CacheHelper.setDarkMode(isDark: true);
        modeIcon = Icons.light_mode_outlined;
        appThemeMode = ThemeMode.dark;
      } else {
        await CacheHelper.setDarkMode(isDark: false);
        modeIcon = Icons.dark_mode_outlined;
        appThemeMode = ThemeMode.light;
      }
    } else {
      modeIcon = fromSharedPreferences
          ? Icons.light_mode_outlined
          : Icons.dark_mode_outlined;
      appThemeMode = fromSharedPreferences ? ThemeMode.dark : ThemeMode.light;
    }

    emit(AppToggleModeIThemeState());
  }

  final List<List<dynamic>> categories = [[], [], [], []];

  //TODO handle error states

  void getNewsOfCategory({required Categories category}) {
    emit(AppGetCategoryNewsLoadingState());
    DioHelper.getDataOfCategory(categoryParams: {
      'category': category.getLabel(),
    }).then((value) {
      categories[category.index] = value.data['results'];
      emit(AppGetCategoryNewsSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(AppGetCategoryNewsErrorState());
    });
  }

  void getNewsOfSearch({required String query}) {
    emit(AppGetSearchLoadingState());
    DioHelper.getDataOfSearch(query: query).then((value) {
      categories[Categories.search.index] = value.data['results'];
      emit(AppGetSearchSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(AppGetSearchErrorState());
    });
  }

  void summerizeContet({required String content}) {
    emit(SummerizationLoadingState());
    DioHelper.summerizeContent(content: content).then((value) {

      emit(SummerizationSuccessState());
      articleModel!.setSummerization(summerization: value);
      changeArticleDisplayText(text: value);
    }).catchError((error) {
      emit(SummerizationErrorState());
    });
  }

  ArticleModelFromNewsData? _articleModel;

  ArticleModelFromNewsData? get articleModel => _articleModel;
  set setArticleModel(ArticleModelFromNewsData articleModel) {
    _articleModel = articleModel;
  }

  late String _articleDisplayText;
  String get articleDisplayText => _articleDisplayText;
  void changeArticleDisplayText({required String text}) {
    _articleDisplayText = text;

    emit(ChangeArticleDisplayTextState());
  }
}
