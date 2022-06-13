import 'package:flutter/material.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/shared/constants.dart';
import '../shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Form(
              key: formKey,
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined),
                ),
                controller: searchController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "field can't be empty";
                  else
                    return null;
                },
                onChanged: (query) {
                  // query.isNotEmpty
                  if(formKey.currentState!.validate()){

                  }
                },
              ),
          ),
      BlocConsumer<NewsCubit, AppState>(
        listener: (context, state){},
        builder: (context, state) => NewsCategoryComponent(
            categoryIndex: Screens.business.index),
      ),
        ],
      ),
    );
  }
}
