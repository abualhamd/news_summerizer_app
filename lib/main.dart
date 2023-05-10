import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/view/cubit/bloc_observer.dart';
import 'app/app.dart';
import 'data/helpers/cache_helper.dart';
import 'data/helpers/dio_helper.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await CacheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}