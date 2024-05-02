import 'package:elkhabr/cubit/cubit.dart';
import 'package:elkhabr/cubit/states.dart';
import 'package:elkhabr/layouts/home_layout.dart';
import 'package:elkhabr/observer.dart';
import 'package:elkhabr/services/cache.dart';
import 'package:elkhabr/utils/helper.dart';
import 'package:elkhabr/utils/thems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Cache.init();
  bool? isDark = Cache.getMode(key: "isDark");
  runApp(
    MyApp(
      isDark: isDark ?? false,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.isDark});

  final bool isDark;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getBusiness()
        ..getSports()
        ..getBusiness()
        ..changeMode(
          fromShared: widget.isDark,
        ),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.scaffoldBackColorLight,
              platform: TargetPlatform.iOS,
              useMaterial3: false,
              fontFamily: "Richard",
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                labelStyle: const TextStyle(
                  color: AppColors.primaryColor,
                ),
                prefixIconColor: AppColors.primaryColor,
              ),
              appBarTheme: const AppBarTheme(
                centerTitle: false,
                titleSpacing: 18,
                actionsIconTheme: IconThemeData(
                  color: Colors.black,
                ),
                backgroundColor: AppColors.scaffoldBackColorLight,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: AppColors.scaffoldBackColorLight,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 20,
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.scaffoldBackColorLight,
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.secondaryColor,
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: AppColors.scaffoldBackColorDark,
              platform: TargetPlatform.iOS,
              useMaterial3: false,
              fontFamily: "Richard",
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                labelStyle: const TextStyle(
                  color: AppColors.primaryColor,
                ),
                prefixIconColor: AppColors.primaryColor,
              ),
              appBarTheme: const AppBarTheme(
                centerTitle: false,
                titleSpacing: 18,
                actionsIconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: AppColors.scaffoldBackColorDark,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: AppColors.scaffoldBackColorDark,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 20,
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.scaffoldBackColorDark,
                selectedItemColor: AppColors.scaffoldBackColorLight,
                unselectedItemColor: AppColors.primaryColor,
              ),
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
            home: const HomeLayoutView(),
            builder: (context, child) => Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            ),
          );
        },
      ),
    );
  }
}
