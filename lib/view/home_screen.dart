import 'package:flutter/material.dart';
import 'package:news_app/view/cubit/cubit.dart';
import 'search_screen.dart';
import 'package:news_app/app/utils/constants.dart';

//TODO add refresh to all screens
//TODO add settings to the application like language and country

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.get(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  cubit.categories[Screens.search.index] = [];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.search)),
            IconButton(
              onPressed: () => cubit.toggleModeIcon(),
              icon: Icon(cubit.modeIcon),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => cubit.changeScreenIndex(index),
          currentIndex: cubit.currentIndex,
          items: cubit.bottomNavigationItems,
        ),
        body: cubit.screens[cubit.currentIndex],
      ),
    );
  }
}
