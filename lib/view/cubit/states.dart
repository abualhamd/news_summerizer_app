abstract class AppState {}

class AppInitState extends AppState {}

class AppChangeScreenIndexState extends AppState {}

class AppToggleModeIThemeState extends AppState {}

//? news loading
class AppGetCategoryNewsLoadingState extends AppState {}

class AppGetCategoryNewsSuccessState extends AppState {}

class AppGetCategoryNewsErrorState extends AppState {}

//? search loading
class AppGetSearchLoadingState extends AppState {}

class AppGetSearchSuccessState extends AppState {}

class AppGetSearchErrorState extends AppState {}

//? summerization loading
class SummerizationLoadingState extends AppState {}

class SummerizationSuccessState extends AppState {
  // String summerization;

  // SummerizationSuccessState();//{required this.summerization}
}

class SummerizationErrorState extends AppState {}

//? changeArticleDisplayText
class ChangeArticleDisplayTextState extends AppState {}
