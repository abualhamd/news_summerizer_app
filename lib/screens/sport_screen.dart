import 'package:flutter/material.dart';
import 'package:news_app/shared/components.dart';

import '../shared/constants.dart';

class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewsCategoryComponent(categoryIndex: Screens.sport.index);

  }
}