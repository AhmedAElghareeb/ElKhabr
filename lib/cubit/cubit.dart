import 'package:elkhabr/cubit/states.dart';
import 'package:elkhabr/modules/business.dart';
import 'package:elkhabr/modules/science.dart';
import 'package:elkhabr/modules/sports.dart';
import 'package:elkhabr/services/cache.dart';
import 'package:elkhabr/services/dio.dart';
import 'package:elkhabr/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: AppStrings.business,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_esports_outlined),
      label: AppStrings.sports,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: AppStrings.science,
    ),
  ];

  List<Widget> views = [
    const BusinessView(),
    const SportsView(),
    const ScienceView(),
  ];

  void changeBottomNavBar(int idx) {
    currentIndex = idx;
    if (idx == 1) {
      getSports();
    }
    if (idx == 2) {
      getScience();
    }
    emit(AppBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(AppGetBusinessLoadingState());

    DioHelper.i.getData(
      path: "v2/top-headlines",
      query: {
        "country": "eg",
        "category": "business",
        "apiKey": "cb13fd1e88174add8c9ff03c0e72ac09",
      },
    ).then((value) {
      business = value.data['articles'];
      emit(
        AppGetBusinessSuccessState(),
      );
    }).catchError((error) {
      emit(
        AppGetBusinessErrorState(
          error.toString(),
        ),
      );
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(AppGetSportsLoadingState());

    if (sports.isEmpty) {
      DioHelper.i.getData(
        path: "v2/top-headlines",
        query: {
          "country": "eg",
          "category": "sports",
          "apiKey": "cb13fd1e88174add8c9ff03c0e72ac09",
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(
          AppGetSportsSuccessState(),
        );
      }).catchError((error) {
        emit(
          AppGetSportsErrorState(
            error.toString(),
          ),
        );
      });
    } else {
      emit(
        AppGetSportsSuccessState(),
      );
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(AppGetScienceLoadingState());

    if (science.isEmpty) {
      DioHelper.i.getData(
        path: "v2/top-headlines",
        query: {
          "country": "eg",
          "category": "science",
          "apiKey": "cb13fd1e88174add8c9ff03c0e72ac09",
        },
      ).then((value) {
        science = value.data['articles'];
        emit(
          AppGetScienceSuccessState(),
        );
      }).catchError((error) {
        emit(
          AppGetScienceErrorState(
            error.toString(),
          ),
        );
      });
    } else {
      emit(
        AppGetScienceSuccessState(),
      );
    }
  }

  bool isDark = false;

  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      Cache.setMode(
        key: "isDark",
        value: isDark,
      ).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
}
