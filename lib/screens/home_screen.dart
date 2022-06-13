import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'search_screen.dart';

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ),
                  );
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () => cubit.toggleModeIcon(),
                icon: Icon(cubit.modeIcon)),
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
