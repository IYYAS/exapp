import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'mainpage/dashboard/addimagepage/component/settingpage.dart';
import 'mainpage/dashboard/dashboard.dart';
import 'mainpage/dashboard/search/search.dart';
import 'mainpage/dashboard/settingpage/cubit/theme_cubit.dart';
import 'mainpage/dashboard/settingpage/cubit2/languge_cubit.dart';
import 'mainpage/dashboard/settingpage/theme.dart';
import 'mainpage/welcomepage/welcomepage.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ThemeCubit(),
      ),
      BlocProvider(
        create: (context) => LangugeCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return BlocBuilder<LangugeCubit, Locale>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Dark Mode with Cubit',
              themeMode: themeMode,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              locale: state, // 👈 language from cubit
              supportedLocales: const [
                Locale('en'),
                Locale('hi'),

              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: Dashboard(),
            );
          },
        );
      },
    );
  }
}

