class AppStates {}

class AppBottomNavState extends AppStates {}

class AppGetBusinessSuccessState extends AppStates {}

class AppGetBusinessLoadingState extends AppStates {}

class AppGetBusinessErrorState extends AppStates {
  final String error;

  AppGetBusinessErrorState(this.error);
}

class AppGetSportsSuccessState extends AppStates {}

class AppGetSportsLoadingState extends AppStates {}

class AppGetSportsErrorState extends AppStates {
  final String error;

  AppGetSportsErrorState(this.error);
}

class AppGetScienceSuccessState extends AppStates {}

class AppGetScienceLoadingState extends AppStates {}

class AppGetScienceErrorState extends AppStates {
  final String error;

  AppGetScienceErrorState(this.error);
}

class AppChangeModeState extends AppStates {}
