import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view/cubit/cubit.dart';
import '../app/config/routes_manager.dart';
import '../app/utils/app_strings.dart';
import '../app/utils/assets_manager.dart';
import 'package:news_app/app/utils/constants.dart';

//TODO add refresh to all screens
//TODO add settings to the application like language and country

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<NewsCubit>();
    final watch = context.watch<NewsCubit>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appTitle),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  read.categories[Screens.search.index] = [];
                  Navigator.pushNamed(
                    context,
                    Routes.searchRoute,
                  );
                },
                icon: const Icon(IconsManager.searchIcon)),
            IconButton(
              onPressed: () => read.toggleModeIcon(),
              icon: Icon(watch.modeIcon),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => context
              .read<NewsCubit>()
              .changeScreenIndex(index), //cubit.changeScreenIndex(index),
          currentIndex: watch.currentIndex,
          items: watch.bottomNavigationItems,
        ),
        body: watch.screens[watch.currentIndex],
      ),
    );
  }
}
