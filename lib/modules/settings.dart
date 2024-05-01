import 'package:easy_localization/easy_localization.dart';
import 'package:elkhabr/cubit/cubit.dart';
import 'package:elkhabr/cubit/states.dart';
import 'package:elkhabr/gen/locale_keys.g.dart';
import 'package:elkhabr/utils/thems.dart';
import 'package:elkhabr/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 120,
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          margin: const EdgeInsetsDirectional.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppColors.primaryColor,
                blurRadius: 2,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SettingsItem(
                title: LocaleKeys.language.tr(),
                iconData: Icons.language_outlined,
                onTap: () {
                  String code =
                      context.locale.languageCode == "en" ? "ar" : "en";
                  context.setLocale(
                    Locale(
                      code,
                    ),
                  );
                },
              ),
              Divider(
                color: AppColors.primaryColor.withOpacity(
                  0.5,
                ),
              ),
              SettingsItem(
                title: LocaleKeys.dark_mode.tr(),
                iconData: Icons.dark_mode_outlined,
                onTap: () {
                  AppCubit.get(context).changeMode();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
