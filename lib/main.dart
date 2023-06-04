import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/view/cubit/bloc_observer.dart';

import 'app/app.dart';
import 'app/utils/shared/set_statusbar_color.dart';
import 'data/helpers/cache_helper.dart';
import 'data/helpers/dio_helper.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    dotenv.load(),
    CacheHelper.init(),
  ]);
  setStatusbarColor();
  DioHelper.init();
  runApp(ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MyApp()));
}
