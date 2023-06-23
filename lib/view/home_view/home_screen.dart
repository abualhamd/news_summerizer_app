import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view/cubit/cubit.dart';

import '../../app/config/routes_manager.dart';
import '../../app/utils/values_managers/app_strings.dart';
import '../../app/utils/values_managers/assets_manager.dart';
import '../../app/utils/enums.dart';

//TODO add refresh to all screens
//TODO add settings to the application like language and country

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<NewsCubit>();
    final watch = context.watch<NewsCubit>();

    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(AppStrings.appTitle),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  read.categories[Categories.search.index] = [];
                  Navigator.pushNamed(
                    context,
                    Routes.searchRoute,
                  );
                },
                icon: const Icon(IconsManager.searchIcon)),
            IconButton(
              onPressed: () async => await read.toggleModeIcon(),
              icon: Icon(watch.modeIcon),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => context.read<NewsCubit>().changeScreenIndex(
              category:
                  Categories.values[index]), //cubit.changeScreenIndex(index),
          currentIndex: watch.currentCategory.index,
          items: watch.bottomNavigationItems,
        ),
        body: watch.screens[watch.currentCategory.index],
      ),
    );
  }
}
