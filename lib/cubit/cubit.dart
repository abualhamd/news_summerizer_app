import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/screens/business.dart';
import 'package:news_app/screens/sports.dart';
import 'package:news_app/screens/science.dart';

enum Screens { business, sport, science }

class NewsCubit extends Cubit<AppState> {
  NewsCubit() : super(AppInitState());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = Screens.business.index;
  IconData modeIcon = Icons.dark_mode_outlined;

  final List<String> _labels = [
    'Business',
    'Sport',
    'Science',
  ];
  final List<Widget> screens = [
    Business(),
    Sports(),
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

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeScreenIndexState());
  }

  void toggleModeIcon() {
    (modeIcon == Icons.dark_mode_outlined)
        ? modeIcon = Icons.light_mode_outlined
        : modeIcon = Icons.dark_mode_outlined;

    emit(AppToggleModeIconState());
  }
// void statusBarColor() => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//   statusBarColor: Colors.white,
// ));
}
