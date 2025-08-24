import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'languge_state.dart';

class LangugeCubit extends Cubit<Locale> {
  LangugeCubit() : super( Locale('en')){
    _loadLocale();

  }
  void changeLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("locale", locale.languageCode);
    emit(locale);
  }

  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString("locale") ?? "en";
    emit(Locale(code));
  }
}
