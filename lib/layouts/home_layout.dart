import 'package:elkhabr/cubit/cubit.dart';
import 'package:elkhabr/cubit/states.dart';
import 'package:elkhabr/utils/app_strings.dart';
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
            title: const Text(
              AppStrings.appTitle,
              style: TextStyle(color: AppColors.primaryColor),
            ),
            toolbarHeight: 100,
            actions: [
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeMode();
                },
                icon: const Icon(
                  Icons.brightness_6_outlined,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: ()
                {

                },
                icon: const Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              const SizedBox(
                width: 20,
              ),
            ],
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
