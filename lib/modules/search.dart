import 'package:elkhabr/cubit/cubit.dart';
import 'package:elkhabr/cubit/states.dart';
import 'package:elkhabr/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.all(20),
                child: defaultTxtField(
                    controller: searchCtrl,
                    type: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "من فضلك قم بإدخال كلمة للبحث!!!";
                      }
                      return null;
                    },
                    label: "إبحث",
                    prefix: Icons.search,
                    onChange: (val) {
                      AppCubit.get(context).getSearch(
                        value: val,
                      );
                    }),
              ),
              Expanded(
                  child: buildArticle(
                list,
              )),
            ],
          ),
        );
      },
    );
  }
}
