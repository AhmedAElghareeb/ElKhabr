import 'package:elkhabr/cubit/cubit.dart';
import 'package:elkhabr/cubit/states.dart';
import 'package:elkhabr/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsView extends StatelessWidget {
  const SportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).sports;
        return buildArticle(
          list,
        );
      },
    );
  }
}
