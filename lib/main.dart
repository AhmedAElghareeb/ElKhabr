import 'package:easy_localization/easy_localization.dart';
import 'package:elkhabr/cubit/cubit.dart';
import 'package:elkhabr/cubit/states.dart';
import 'package:elkhabr/layouts/home_layout.dart';
import 'package:elkhabr/observer.dart';
import 'package:elkhabr/services/cache.dart';
import 'package:elkhabr/utils/thems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await EasyLocalization.ensureInitialized();
  await Cache.init();
  bool? isDark = Cache.getData(key: "isDark");
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      saveLocale: true,
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('en'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      child: MyApp(
        isDark: isDark!,
      ),
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
      create: (context) => AppCubit()..getBusiness()..changeMode(
        fromShared: widget.isDark,
      ),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.scaffoldBackColorLight,
              platform: TargetPlatform.iOS,
              useMaterial3: false,
              fontFamily: "Richard",
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              appBarTheme: const AppBarTheme(
                centerTitle: false,
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
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              appBarTheme: const AppBarTheme(
                centerTitle: false,
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
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            home: const HomeLayoutView(),
          );
        },
      ),
    );
  }
}

