import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light){
    _loadTheme();

  }
  void toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDarkMode", isDark);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool("isDarkMode") ?? false;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
