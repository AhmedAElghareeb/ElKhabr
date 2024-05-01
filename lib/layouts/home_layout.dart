import 'package:easy_localization/easy_localization.dart';
import 'package:elkhabr/cubit/cubit.dart';
import 'package:elkhabr/cubit/states.dart';
import 'package:elkhabr/gen/locale_keys.g.dart';
import 'package:elkhabr/utils/thems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.daily_news.tr(),
              style: const TextStyle(color: AppColors.primaryColor),
            ),
          ),
          body: cubit.views[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
